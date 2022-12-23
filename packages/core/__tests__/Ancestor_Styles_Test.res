open Jest
open Expect

module Styles = Ancestor_Styles.Make(Ancestor.DefaultConfig)

describe("Styles", () => {
  describe(".createCssValueFromArray", () => {
    test(
      "should create responsive CSS for the attribute provided",
      () => {
        let spacing = v => v->Ancestor.DefaultConfig.spacing->Styles.Css.Length.toString
        let padding = Styles.createResponsiveValue("padding", Some({xs: 2, md: 4}), spacing)

        let width = Styles.createResponsiveValue(
          "width",
          Some({xs: 100.0->#pct, md: #px(32)}),
          Styles.Css.Length.toString,
        )

        expect(padding)->toMatchSnapshot
        expect(width)->toMatchSnapshot
      },
    )
  })

  describe(".mediaQuery", () => {
    test(
      "should create a media query correctly",
      () => {
        let mediaQuery = Styles.mediaQuery("display: block;", Xs, "display: flex")

        expect(mediaQuery)->toMatchSnapshot
      },
    )
  })

  describe(".createResponsiveProp", () => {
    test(
      "should create responsive styles correctly",
      () => {
        let styles = Styles.createResponsiveProp(
          ~prop=Some({xs: 1, md: 2}),
          value => `padding: ${value->Js.Int.toString};`,
        )

        expect(styles)->toMatchSnapshot
      },
    )

    test(
      "should add default styles correctly",
      () => {
        let styles = Styles.createResponsiveProp(
          ~prop=None,
          ~defaultStyles="border: solid 1px red;",
          _ => "",
        )
        expect(styles)->toMatchSnapshot
      },
    )
  })
})
