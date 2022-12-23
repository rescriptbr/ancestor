include Ancestor_Core

module DefaultConfig = {
  @ppx_ts.keyOf
  type breakpoints<'a> = {
    xs?: 'a,
    sm?: 'a,
    md?: 'a,
    lg?: 'a,
    xl?: 'a,
  }
  type fields = breakpoints_keyOf
  let encode = breakpoints => [
    (Xs, breakpoints.xs),
    (Sm, breakpoints.sm),
    (Md, breakpoints.md),
    (Lg, breakpoints.lg),
    (Xl, breakpoints.xl),
  ]
  type spacing = int
  type radius = int
  type zIndex = int
  type colors = Ancestor_Css.Color.t

  let zIndex = v => v
  let colors = v => v
  let spacing = spacing => #px(spacing * 8)
  let radius = radius => #px(radius * 8)

  let sizeByBreakpoints = breakpoint =>
    switch breakpoint {
    | Xs => 0
    | Sm => 475
    | Md => 920
    | Lg => 1280
    | Xl => 1920
    }

  let css = Emotion.rawCss
}

include Make(DefaultConfig)
include DefaultConfig
