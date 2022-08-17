module type T = {
  type breakpoints<'value>
  type spacing
  type radius
  type colors
  type zIndex

  let zIndex: zIndex => int
  let colors: colors => Ancestor_Css.Color.t
  let spacing: spacing => Ancestor_Css.Length.t
  let radius: radius => Ancestor_Css.Length.t
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let sizeByBreakpoints: breakpoints<'value> => int
  let css: string => string
}
