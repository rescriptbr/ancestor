module Create = (CssConfig: Css.T) => {
  module Theme = Theme.Make(CssConfig)

  module Make = (ThemeContext: Theme.T) => {
    module Styles = {
      let button = (~theme: option<Theme.ButtonTokens.t>) => {
        let customBaseStyles =
          theme
          ->Belt.Option.flatMap(t => t.baseStyles)
          ->Belt.Option.mapWithDefault("", Theme.Css.toCss)
          ->Emotion.rawCss

        let baseStyles = Emotion.css({
          /*
           * Button defaults
           */
          "border": "transparent",
          /*
           * Based on size tokens
           */
          "fontSize": "16px",
        })

        Emotion.cx([baseStyles, customBaseStyles])
      }
    }

    @react.component
    let make = (
      ~color: Theme.ButtonTokens.color=#primary,
      ~size: Theme.ButtonTokens.size=#md,
      ~children,
    ) => {
      let theme = ThemeContext.useTheme()
      let className = Styles.button(~theme=theme.button)

      <button className> {children} </button>
    }
  }
}
