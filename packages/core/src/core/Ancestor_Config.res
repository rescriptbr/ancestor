module type Breakpoints = {
  type breakpoints<'value>
  type breakpoints_keyOf
  let encode: breakpoints<'value> => array<(breakpoints_keyOf, option<'value>)>
  let sizeByBreakpoints: breakpoints_keyOf => int
}

module type T = {
  type breakpoints<'value>
  type breakpoints_keyOf
  type spacing
  type radius
  type colors
  type zIndex
  let encode: breakpoints<'value> => array<(breakpoints_keyOf, option<'value>)>
  let zIndex: zIndex => int
  let colors: colors => AncestorCss_Types.Color.t
  let spacing: spacing => AncestorCss_Types.Length.t
  let radius: radius => AncestorCss_Types.Length.t
  let sizeByBreakpoints: breakpoints_keyOf => int
}
