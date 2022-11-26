open Node

module Modules = {
  type t = Base | Hidden | Stack | Grid | Box

  let componentsPath = Path.join([NodeJs.Global.dirname, "..", "src", "components"])

  let getPath = m => {
    let modulePath = switch m {
    | Base => ["base", "Ancestor_Base.res"]
    | Hidden => ["hidden", "Ancestor_Hidden.res"]
    | Box => ["box", "Ancestor_Box.res"]
    | Grid => ["grid", "Ancestor_Grid.res"]
    | Stack => ["stack", "Ancestor_Stack.res"]
    }

    Path.join([componentsPath]->Js.Array2.concat(modulePath))
  }

  let get = m => Fs.readFileSync(getPath(m), #utf8)->Js.String2.split("\n")

  let write = (content, m) => {
    let path = getPath(m)

    Fs.writeFileSync(path, content, #utf8)
    Child_process.execSync(`yarn rescript format ${path}`, Child_process.option())->ignore
  }
}

module PropsCollector = {
  type prefix = Start | End

  module type Prefix = {
    type t = prefix
    let fromString: string => option<t>
  }

  module type PrefixInterface = {
    let startPrefix: Js.Re.t
    let endPrefix: Js.Re.t
  }

  module MakePrefix = (M: PrefixInterface): Prefix => {
    type t = prefix

    let fromString = line => {
      if M.startPrefix->Js.Re.test_(line) {
        Some(Start)
      } else if M.endPrefix->Js.Re.test_(line) {
        Some(End)
      } else {
        None
      }
    }
  }

  module DeclarationPrefix = MakePrefix({
    let startPrefix = "declaration:start"->Js.Re.fromStringWithFlags(~flags="ig")
    let endPrefix = "declaration:end"->Js.Re.fromStringWithFlags(~flags="ig")
  })

  module ForwardFnPrefix = MakePrefix({
    let startPrefix = "forward-fn:start"->Js.Re.fromStringWithFlags(~flags="ig")
    let endPrefix = "forward-fn:end"->Js.Re.fromStringWithFlags(~flags="ig")
  })

  module ForwardPrefix = MakePrefix({
    let startPrefix = "forward:start"->Js.Re.fromStringWithFlags(~flags="ig")
    let endPrefix = "forward:end"->Js.Re.fromStringWithFlags(~flags="ig")
  })

  type lineCollector = {
    collect: bool,
    lines: array<string>,
  }

  type collector<'prefix> = {
    prefix: option<'prefix>,
    head: array<string>,
    tail: array<string>,
  }

  type api = {
    props: array<string>,
    head: array<string>,
    tail: array<string>,
  }

  let getPropsList = (lines, prefix: module(Prefix)) => {
    let module(Prefix) = prefix

    let collector = lines->Js.Array2.reduce((collector, line) => {
      let prefix = Prefix.fromString(line)

      switch (collector, prefix) {
      | ({collect: true, lines}, None) => {
          collect: true,
          lines: lines->Js.Array2.concat([line]),
        }
      | ({collect: true, lines}, Some(End)) => {collect: false, lines}
      | ({collect: false}, Some(Start)) => {collect: true, lines: []}
      | (_, _) => collector
      }
    }, {collect: false, lines: []})
    collector.lines
  }

  let extractLines = (lines, prefix: module(Prefix)) => {
    let module(Prefix) = prefix

    lines->Js.Array2.reduce((collector, line) => {
      let prefix = Prefix.fromString(line)

      switch (collector, prefix) {
      | ({head, prefix: None}, None) => {
          ...collector,
          head: head->Js.Array2.concat([line]),
        }
      | ({head, prefix: None}, Some(Start)) => {
          ...collector,
          prefix: Some(Start),
          head: head->Js.Array2.concat([line]),
        }
      | ({prefix: Some(Start), tail}, Some(End)) => {
          ...collector,
          tail: tail->Js.Array2.concat([line]),
          prefix: Some(End),
        }
      | ({prefix: Some(End), tail}, None) => {
          ...collector,
          tail: tail->Js.Array2.concat([line]),
        }
      | _ => collector
      }
    }, {tail: [], head: [], prefix: None})
  }

  let extract = (fileContent, ~prefix: module(Prefix)) => {
    let module(Prefix) = prefix
    let propsList = fileContent->getPropsList(module(Prefix))
    let fileLines = fileContent->extractLines(module(Prefix))
    {
      props: propsList,
      head: fileLines.head,
      tail: fileLines.tail,
    }
  }
}

module PropsUpdater = {
  type t = Declaration | Forward | ForwardToFn

  let updateList = (propsList, ~props, ~kind) => {
    let updatedProps = props->Js.Array2.map(propName =>
      switch kind {
      | Declaration => `~${propName}=?,`
      | Forward => `?${propName}`
      | ForwardToFn => `~${propName}?,`
      }
    )

    propsList->Js.Array2.concat(updatedProps)
  }

  let add = (fileContent, ~newProps, ~collectorPrefix: module(PropsCollector.Prefix), ~kind) => {
    let moduleApi = PropsCollector.extract(fileContent, ~prefix=collectorPrefix)

    let updatedDeclarationProps = moduleApi.props->updateList(~props=newProps, ~kind)

    moduleApi.head->Js.Array2.concatMany([updatedDeclarationProps, moduleApi.tail])
  }
}

/*
 * Get the props list from the command args
 */
let newProps = Process.argv->Belt.Array.sliceToEnd(2)

/*
 * All modules that are using responsive props
 */
let modules: array<Modules.t> = [Base, Hidden, Stack, Grid, Box]

let updateModuleProps = (m: Modules.t) => {
  let forwardKind = m === Base ? PropsUpdater.ForwardToFn : PropsUpdater.Forward
  let prefixModule: module(PropsCollector.Prefix) =
    m === Base ? module(PropsCollector.ForwardFnPrefix) : module(PropsCollector.ForwardPrefix)

  Modules.get(m)
  ->PropsUpdater.add(
    ~collectorPrefix=module(PropsCollector.DeclarationPrefix),
    ~newProps,
    ~kind=Declaration,
  )
  ->PropsUpdater.add(~collectorPrefix=prefixModule, ~newProps, ~kind=forwardKind)
  ->Js.Array2.joinWith("\n")
  ->Modules.write(m)
}

modules->Js.Array2.forEach(updateModuleProps)
