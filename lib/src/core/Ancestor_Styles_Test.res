open Ancestor_Jest

module Config = {
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
module Styles = Ancestor_Styles.Make(Config)

describe("Styles", (. ()) => {
  describe(".createCssValueFromArray", (. ()) => {
    it("should create responsive CSS for the attribute provided", (. ()) => {
      let padding = Styles.createCssValueFromArray(
        "padding",
        Some([#xs(2), #md(4)]),
        Styles.Spacing.make,
      )

      let width = Styles.createCssValueFromArray(
        "width",
        Some([#xs(100.0->#pct), #md(32->#px)]),
        Ancestor_CssTypes.Length.toString,
      )

      expect(padding)->toMatchSnapshot
      expect(width)->toMatchSnapshot
    })
  })

  describe(".mediaQuery", (. ()) => {
    it("should create a media query correctly", (. ()) => {
      let mediaQuery = Styles.mediaQuery("display: block;", #xs(), "display: flex")

      expect(mediaQuery)->toMatchSnapshot
    })
  })

  describe(".createResponsiveProp", (. ()) => {
    it("should create responsive styles correctly", (. ()) => {
      let styles = Styles.createResponsiveProp(~prop=Some([#xs(1), #md(2)]), value =>
        `padding: ${value->Js.Int.toString};`
      )

      expect(styles)->toMatchSnapshot
    })

    it("should add default styles correctly", (. ()) => {
      let styles = Styles.createResponsiveProp(
        ~prop=None,
        ~defaultStyles="border: solid 1px red;",
        _ => "",
      )
      expect(styles)->toMatchSnapshot
    })
  })
})
