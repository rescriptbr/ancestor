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
  let colors: colors => Css_AtomicTypes.Color.t
  let spacing: spacing => Css_AtomicTypes.Length.t
  let radius: radius => Css_AtomicTypes.Length.t
  let sizeByBreakpoints: keyOfBreakpoints => int
}
