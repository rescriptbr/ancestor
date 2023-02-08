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
  {
    type spacing = int
    let spacing = v => #px(v * 8)
  },
  {
    type radius = int
    let radius = v => #px(v * 8)
  },
  {
    type zIndex = int
    let zIndex = v => v
  },
)
