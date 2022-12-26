module type Breakpoints = {
  type breakpoints<'value>
  type breakpoints_keyOf
  let encode: breakpoints<'value> => array<(breakpoints_keyOf, option<'value>)>
  let sizeByBreakpoints: breakpoints_keyOf => int
}

module type Spacing = {
  type spacing
  let spacing: spacing => Ancestor_Css.Length.t
}

module type Radius = {
  type radius
  let radius: radius => Ancestor_Css.Length.t
}

module type ZIndex = {
  type zIndex
  let zIndex: zIndex => int
}

module type Colors = {
  type colors
  let colors: colors => Ancestor_Css.Color.t
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
  let colors: colors => Ancestor_Css.Color.t
  let spacing: spacing => Ancestor_Css.Length.t
  let radius: radius => Ancestor_Css.Length.t
  let sizeByBreakpoints: breakpoints_keyOf => int
}
