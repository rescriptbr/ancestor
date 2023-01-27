/*
 * NOTE: The breakpoint module used to create the custom breakpoints API.
 */
module type Breakpoints = {
  type breakpoints<'value>
  type keyOfBreakpoints
  let encode: breakpoints<'value> => array<(keyOfBreakpoints, option<'value>)>
  let sizeByBreakpoints: keyOfBreakpoints => int
}

module type T = {
  type breakpoints<'value>
  type keyOfBreakpoints
  type spacing
  type radius
  type colors
  type zIndex
  let encode: breakpoints<'value> => array<(keyOfBreakpoints, option<'value>)>
  let zIndex: zIndex => int
  let colors: colors => AncestorCss_Types.Color.t
  let spacing: spacing => AncestorCss_Types.Length.t
  let radius: radius => AncestorCss_Types.Length.t
  let sizeByBreakpoints: keyOfBreakpoints => int
}
