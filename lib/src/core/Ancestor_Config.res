module type T = {
  type breakpoints<'value>
  type spacing
  type radius
  let spacing: spacing => Ancestor_Css.Length.t
  let radius: radius => Ancestor_Css.Length.t
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let sizeByBreakpoints: breakpoints<'value> => int
  let css: string => string
}
