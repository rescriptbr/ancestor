include Ancestor_Core

module Defaults = {
  type defaultBreakpoints<'a> = {
    xs?: 'a,
    sm?: 'a,
    md?: 'a,
    lg?: 'a,
    xl?: 'a,
  }

  type defaultFields = XS | SM | MD | LG | XL
}
module DefaultConfig = {
  open Defaults
  type breakpoints<'a> = Defaults.defaultBreakpoints<'a>
  type fields = Defaults.defaultFields
  type spacing = int
  type radius = int
  type zIndex = int
  type colors = Ancestor_Css.Color.t

  let encode = breakpoints => [
    (XS, breakpoints.xs),
    (SM, breakpoints.sm),
    (MD, breakpoints.md),
    (LG, breakpoints.lg),
    (XL, breakpoints.xl),
  ]
  let zIndex = v => v
  let colors = v => v
  let spacing = spacing => #px(spacing * 8)
  let radius = radius => #px(radius * 8)

  let sizeByBreakpoints = breakpoint =>
    switch breakpoint {
    | XS => 0
    | SM => 475
    | MD => 920
    | LG => 1280
    | XL => 1920
    }

  let css = Ancestor_Emotion.css
}

include Make(DefaultConfig)
