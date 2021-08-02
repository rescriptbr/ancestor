include Ancestor_Core

module DefaultConfig: AncestorCoreConfig = {
  type breakpoints<'a> = [#xxs('a) | #xs('a) | #sm('a) | #md('a) | #lg('a) | #xl('a)]

  let spacing = 8.0

  let sizeByBreakpoints = values =>
    switch values {
    | #xxs(_) => 0
    | #xs(_) => 375
    | #sm(_) => 600
    | #md(_) => 920
    | #lg(_) => 1280
    | #xl(_) => 1920
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #xxs(v) => v
    | #xs(v) => v
    | #sm(v) => v
    | #md(v) => v
    | #lg(v) => v
    | #xl(v) => v
    }
}

module Default = Make(DefaultConfig)
