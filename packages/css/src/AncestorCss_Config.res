module type Spacing = {
  type spacing
  let spacing: spacing => Css_AtomicTypes.Length.t
}

module type Radius = {
  type radius
  let radius: radius => Css_AtomicTypes.Length.t
}

module type ZIndex = {
  type zIndex
  let zIndex: zIndex => int
}

module type Colors = {
  type colors
  let colors: colors => AncestorCss_WrappedTypes.Color.t
}

module type Breakpoints = {
  type breakpoints
  let sizeByBreakpoints: breakpoints => int
}

module type Typography = {
  type fontFamily
  type fontSize
  type fontWeight
  type lineHeight
  type letterSpacing

  let fontFamily: fontFamily => AncestorCss_WrappedTypes.FontFamily.t
  let fontSize: fontSize => Css_AtomicTypes.Length.t
  let fontWeight: fontWeight => Css_AtomicTypes.FontWeight.t
  let lineHeight: lineHeight => AncestorCss_WrappedTypes.LineHeight.t
  let letterSpacing: letterSpacing => Css_AtomicTypes.Length.t
}

module type Shadows = {
  type textShadow
  type boxShadow

  let textShadow: textShadow => AncestorCss_WrappedTypes.TextShadow.t
  let boxShadow: boxShadow => AncestorCss_WrappedTypes.BoxShadow.t
}
