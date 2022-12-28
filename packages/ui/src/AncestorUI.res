module Make = (Spacing: Theme.Spacing) => {
  module CssConfig = {
    type spacing = Spacing.spacing
    let spacing = Spacing.spacing
  }

  module Theme = Theme.Make(CssConfig)
  module ThemeProvider = Theme.Provider

  module ThemeConfig = {
    let useTheme = Theme.useTheme
  }

  module InternalButton = Button.Create(CssConfig)
  module Button = InternalButton.Make(ThemeConfig)
}
