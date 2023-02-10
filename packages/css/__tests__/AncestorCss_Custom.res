include AncestorCss.Make(
  {
    type breakpoints = [#xs | #sm]
    let sizeByBreakpoints = v =>
      switch v {
      | #xs => 0
      | #sm => 470
      }
  },
  {
    type colors = [#primary | #secondary]
    let colors = (x: colors) =>
      switch x {
      | #primary => #hex("fc0")
      | #secondary => #hex("363636")
      }
  },
  AncestorCss.Defaults.Spacing,
  AncestorCss.Defaults.Radius,
  AncestorCss.Defaults.ZIndex,
  AncestorCss.Defaults.Typography,
  AncestorCss.Defaults.Shadows,
)
