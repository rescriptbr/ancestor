module Make = (Config: Theme.CustomTheme) => {
  module ThemeConstructor = {
    let theme = Theme.mergeWithDefaults(Config.theme)
  }
  /*
   *  Mappers
   */
  let colors = token =>
    switch Config.theme.colors {
    | None => Theme.default.colors(token)
    | Some(colors) => colors(token)
    }

  /*
   * Components
   */
  module Button = Button.Make(ThemeConstructor)

  /*
   * Ancestor config
   */
  module AncestorBaseConfig = {
    type breakpoints<'a> = {
      xs?: 'a,
      sm?: 'a,
      md?: 'a,
      lg?: 'a,
      xl?: 'a,
    }
    type fields = Xs | Sm | Md | Lg | Xl
    let encode = breakpoints => [
      (Xs, breakpoints.xs),
      (Sm, breakpoints.sm),
      (Md, breakpoints.md),
      (Lg, breakpoints.lg),
      (Xl, breakpoints.xl),
    ]
    type spacing = int
    type radius = int
    type zIndex = int
    /*
     * Colors
     */
    type colors = Theme.colors
    let colors = colors

    let zIndex = v => v
    let spacing = spacing => #px(spacing * 8)
    let radius = radius => #px(radius * 8)

    let sizeByBreakpoints = breakpoint =>
      switch breakpoint {
      | Xs => 0
      | Sm => 475
      | Md => 920
      | Lg => 1280
      | Xl => 1920
      }

    let css = Ancestor_Emotion.css
  }
}

include Make({
  let theme: Theme.custom = {}
})
