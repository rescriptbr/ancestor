open AncestorCss_Types

module type Spacing = {
  type spacing
  let spacing: spacing => Length.t
}

module type Radius = {
  type radius
  let radius: radius => Length.t
}

module type ZIndex = {
  type zIndex
  let zIndex: zIndex => int
}

module type Colors = {
  type colors
  let colors: colors => Color.t
}
