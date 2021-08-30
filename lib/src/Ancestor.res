include Ancestor_Core

module DefaultConfig = {
  type breakpoints<'a> = [#xs('a) | #xs('a) | #sm('a) | #md('a) | #lg('a) | #xl('a)]

  type columns = [
    | #1
    | #2
    | #3
    | #4
    | #5
    | #6
    | #7
    | #8
    | #9
    | #10
    | #11
    | #12
  ]

  let spacing = 8.0

  let radius = 8.0

  let sizeByBreakpoints = values =>
    switch values {
    | #xs(_) => 0
    | #sm(_) => 475
    | #md(_) => 920
    | #lg(_) => 1280
    | #xl(_) => 1920
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #xs(v) => v
    | #sm(v) => v
    | #md(v) => v
    | #lg(v) => v
    | #xl(v) => v
    }

  let css = Ancestor_Emotion.css
}

module Default = {
  include Make(DefaultConfig)

  let xs = v => #xs(v)
  let sm = v => #sm(v)
  let md = v => #md(v)
  let lg = v => #lg(v)
  let xl = v => #xl(v)
}
