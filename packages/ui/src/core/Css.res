let propsTransformer = (key, maybeValue, parse) =>
  maybeValue->Belt.Option.map(value => `${key}:${parse(value)};`)

module type T = {
  type spacing
  let spacing: spacing => Ancestor_Css.Length.t
}

module Make = (Config: T) => {
  include Ancestor_Css.Make({
    type spacing = Config.spacing
    let spacing = Config.spacing

    type colors = ThemeTokens.colors
    let colors = ThemeTokens.defaultColors

    type radius = float
    let radius = v => #pxFloat(v *. 8.0)

    type zIndex = int
    let zIndex = v => v

    type propsWrapper<'value> = 'value
    let propsTransformer = propsTransformer
  })
}

include Make({
  type spacing = float
  let spacing = v => #pxFloat(v *. 8.0)
})
