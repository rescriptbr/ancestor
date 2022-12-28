module type Spacing = {
  type spacing
  let spacing: spacing => Ancestor_Css.Length.t
}

module Make = (CssConfig: Css.T) => {
  module ButtonTokens = ButtonTokens.Make(CssConfig)
  module Css = Css.Make(CssConfig)

  type theme = {
    // TODO: Temp colors field
    colors?: ThemeTokens.colors => Css.Color.t,
    /*
     * Button
     */
    button?: ButtonTokens.t,
  }

  module type T = {
    let useTheme: unit => theme
  }

  module Context = {
    let initial: theme = {}
    let context = React.createContext(initial)
    module Provider = {
      let make = React.Context.provider(context)
    }

    let useTheme = () => React.useContext(context)
  }

  module Provider = Context.Provider
  let useTheme = Context.useTheme
}
