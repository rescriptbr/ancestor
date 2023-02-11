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
  type fontFamily
  type fontSize
  type fontWeight
  type lineHeight
  type letterSpacing
  type textShadow
  type boxShadow

  let encode: breakpoints<'value> => array<(keyOfBreakpoints, option<'value>)>
  let zIndex: zIndex => int
  let colors: colors => AncestorCss_WrappedTypes.Color.t
  let spacing: spacing => Css_AtomicTypes.Length.t
  let radius: radius => Css_AtomicTypes.Length.t
  let sizeByBreakpoints: keyOfBreakpoints => int
  let fontFamily: fontFamily => AncestorCss_WrappedTypes.FontFamily.t
  let fontSize: fontSize => Css_AtomicTypes.Length.t
  let fontWeight: fontWeight => Css_AtomicTypes.FontWeight.t
  let lineHeight: lineHeight => AncestorCss_WrappedTypes.LineHeight.t
  let letterSpacing: letterSpacing => Css_AtomicTypes.Length.t
  let textShadow: textShadow => AncestorCss_WrappedTypes.TextShadow.t
  let boxShadow: boxShadow => AncestorCss_WrappedTypes.BoxShadow.t
}
