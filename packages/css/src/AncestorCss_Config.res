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
  let colors: colors => Css_AtomicTypes.Color.t
}

module type Breakpoints = {
  type breakpoints
  let sizeByBreakpoints: breakpoints => int
}
