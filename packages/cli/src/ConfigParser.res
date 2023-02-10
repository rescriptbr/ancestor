module Classifier = {
  type any
  type tagged<'keyValue> = Object(array<(string, 'keyValue)>) | Unknown

  let objectFromAny = value => {
    let value: Js.Dict.t<'value> = Obj.magic(value)
    Object(value->Js.Dict.entries)
  }

  let classify = any => {
    let typeof = Js.typeof(any->Obj.magic)
    switch typeof {
    | "object" => objectFromAny(any)
    | _ => Unknown
    }
  }
}

type configValue
type configRaw = {breakpoints?: configValue}

module Breakpoints = {
  type breakpointItem = {key: string, value: int}
  type t = array<breakpointItem>
  let itemsFromEntries = entries => entries->Js.Array2.map(((key, value)) => {key, value})
  let fromRaw = value =>
    value
    ->Belt.Option.map(Classifier.classify)
    ->Belt.Option.flatMap(v =>
      switch v {
      | Object(entries) => Some(itemsFromEntries(entries))
      | _ => None
      }
    )
}

type config = {breakpoints?: Breakpoints.t}

let parseConfig = (configRaw: configRaw): config => {
  breakpoints: ?configRaw.breakpoints->Breakpoints.fromRaw,
}

let configFilePath = Node.Path.join([Node.Process.cwd(), `ancestor.config.js`])

@val external _require: string => configRaw = "require"

let getConfig = () => {
  _require(configFilePath)->parseConfig->Js.log
}
