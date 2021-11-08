include Ancestor_Core

module DefaultConfig = {
  type breakpoints<'a> = [#xs('a) | #xs('a) | #sm('a) | #md('a) | #lg('a) | #xl('a)]

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

  @ocaml.doc("
    * Alias function to the #xs('value) breakpoint
  ")
  let xs = v => #xs(v)
  @ocaml.doc("
    * Alias function to the #sm('value) breakpoint
    * Size: 475px
  ")
  let sm = v => #sm(v)
  @ocaml.doc("
    * Alias function to the #md('value) breakpoint
    * Size: 920px
  ")
  let md = v => #md(v)
  @ocaml.doc("
    * Alias function to the #lg('value) breakpoint
    * Size: 1280px
  ")
  let lg = v => #lg(v)
  @ocaml.doc("
    * Alias function to the #xl('value) breakpoint. 
    * Size: 1920px
  ")
  let xl = v => #xl(v)
}

include Make(DefaultConfig)

@ocaml.doc("
    * Alias function to the #xs('value) breakpoint
  ")
let xs = v => #xs(v)
@ocaml.doc("
    * Alias function to the #sm('value) breakpoint
    * Size: 475px
  ")
let sm = v => #sm(v)
@ocaml.doc("
    * Alias function to the #md('value) breakpoint
    * Size: 920px
  ")
let md = v => #md(v)
@ocaml.doc("
    * Alias function to the #lg('value) breakpoint
    * Size: 1280px
  ")
let lg = v => #lg(v)
@ocaml.doc("
    * Alias function to the #xl('value) breakpoint. 
    * Size: 1920px
  ")
let xl = v => #xl(v)
