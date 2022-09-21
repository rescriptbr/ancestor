module type T = {
  type breakpoints<'value>
  type fields
  type spacing
  type radius
  type colors
  type zIndex
  let encode: breakpoints<'value> => array<(fields, option<'value>)>
  let zIndex: zIndex => int
  let colors: colors => Ancestor_Css.Color.t
  let spacing: spacing => Ancestor_Css.Length.t
  let radius: radius => Ancestor_Css.Length.t
  let sizeByBreakpoints: fields => int
  let css: string => string
}
