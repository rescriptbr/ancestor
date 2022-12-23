module Make = (Config: Theme.Theme) => {
  module Styles = {
    open Ancestor_Css
    let theme = Config.theme
    let buttonTheme = Config.theme.button

    let button = (~size, ~color) => {
      let {height, fontSize} = switch size {
      | #lg => buttonTheme.lg
      | #md => buttonTheme.md
      | #sm => buttonTheme.sm
      }

      Emotion.css({
        /*
         * Button defaults
         */
        "border": "transparent",
        /*
         * Based on color tokens
         */
        "backgroundColor": switch color {
        | #primary => theme.colors(#primary600)->Color.toString
        },
        /*
         * Based on size tokens
         */
        "height": height->Length.toString,
        "fontSize": fontSize->Length.toString,
      })
    }
  }

  @react.component
  let make = (~color: ButtonTokens.color=#primary, ~size: ButtonTokens.size=#md, ~children) => {
    let className = Styles.button(~size, ~color)

    <button className> {children} </button>
  }
}
