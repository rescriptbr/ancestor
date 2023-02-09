module Colors = {
  type colors<'custom> = [#primary | #secondary | #custom('custom)]
}

module type CustomColorsConfig = {
  type colors
  let colors: Colors.colors<colors> => Css_AtomicTypes.Color.t
}

type theme = {button?: ButtonTokens.api}

module type T = {
  let theme: theme
}

module type Config = {
  type breakpoints<'value>
  type keyOfBreakpoints
  type spacing
  type radius
  type colors
  type zIndex
  let encode: breakpoints<'value> => array<(keyOfBreakpoints, option<'value>)>
  let zIndex: zIndex => int
  let colors: Colors.colors<colors> => Css_AtomicTypes.Color.t
  let spacing: spacing => Css_AtomicTypes.Length.t
  let radius: radius => Css_AtomicTypes.Length.t
  let sizeByBreakpoints: keyOfBreakpoints => int
  let theme: theme
}
