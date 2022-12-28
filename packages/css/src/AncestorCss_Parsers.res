module type Config = {
  type t<'a>
  let parse: (string, option<t<'a>>, 'a => string) => option<string>
}

module Simple = {
  type t<'a> = 'a

  let parse = (key, maybeValue, parse) =>
    maybeValue->Belt.Option.map(value => `${key}:${parse(value)};`)
}
