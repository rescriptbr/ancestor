open Jest
open! Expect
module Renderer = ReactTestRenderer

/*
 * Custom CSS setup for tests.
 */
module CustomCss = {
  open AncestorCss.Defaults

  module CustomColors = {
    type colors = [#primary | #secondary]

    let colors = token =>
      switch token {
      | #primary => #hex("#000")
      | #secondary => #hex("#ccc")
      }
  }

  module CustomSpacing = {
    type spacing = [#md | #sm]
    let spacing = token =>
      switch token {
      | #md => #px(32)
      | #sm => #px(64)
      }
  }

  module CustomRadius = {
    type radius = float
    let radius = token => #pxFloat(token *. 8.0)
  }

  include AncestorCss.Make(
    CustomSpacing,
    CustomRadius,
    CustomColors,
    ZIndex,
    AncestorCss_Parsers.Simple,
  )
}

/*
 * Base component using all token customizations
 * from the setup above.
 */
module CustomCssComponent = {
  @react.component
  let make = () => {
    let css = CustomCss.useCss()
    let className = css.createClass({
      display: #flex,
      bgColor: #primary,
      color: #secondary,
      fontSize: #rem(2.4),
      fontWeight: #700,
      width: #pxFloat(200.),
      p: #sm,
      mt: #md,
      borderRadius: 2.0,
    })

    <div className />
  }
}

describe("AncestorCss", () => {
  describe(".parseToCss", () => {
    test(
      "should generate a simple className correctly",
      () => {
        let className = AncestorCss.createClass({
          display: #flex,
          bgColor: #hex("#fafafa"),
          color: #hex("#000"),
          fontSize: #rem(2.4),
          fontWeight: #700,
          width: #pxFloat(200.),
          p: #px(32),
          mt: #px(64),
          borderRadius: #px(8),
        })

        expect(Renderer.create(<div className />)->Renderer.toJSON)->toMatchSnapshot
      },
    )

    test(
      "should generate the styles correctly using the customization tokens",
      () => {
        expect(Renderer.create(<CustomCssComponent />)->Renderer.toJSON)->toMatchSnapshot
      },
    )

    test(
      "should generate the styles correctly using the customization passed to the provider",
      () => {
        let customTokens = {
          open CustomCss.Context
          open AncestorCss.Defaults

          {
            colors: token =>
              switch token {
              | #primary => #hex("#cecece")
              | #secondary => #hex("#363636")
              },
            spacing: token =>
              switch token {
              | #sm => #rem(2.4)
              | #md => #rem(3.2)
              },
            radius: token => #pxFloat(token *. 4.0),
            zIndex: ZIndex.zIndex,
          }
        }

        expect(
          Renderer.create(
            <CustomCss.Provider value=customTokens>
              <CustomCssComponent />
            </CustomCss.Provider>,
          )->Renderer.toJSON,
        )->toMatchSnapshot
      },
    )
  })
})
