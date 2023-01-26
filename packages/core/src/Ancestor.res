include Ancestor_Core

module Defaults = {
  module Breakpoints = {
    @ppx_ts.keyOf
    type breakpoints<'a> = {
      xs?: 'a,
      sm?: 'a,
      md?: 'a,
      lg?: 'a,
      xl?: 'a,
    }
    let encode = breakpoints => [
      (Xs, breakpoints.xs),
      (Sm, breakpoints.sm),
      (Md, breakpoints.md),
      (Lg, breakpoints.lg),
      (Xl, breakpoints.xl),
    ]
    let sizeByBreakpoints = breakpoint =>
      switch breakpoint {
      | Xs => 0
      | Sm => 475
      | Md => 920
      | Lg => 1280
      | Xl => 1920
      }
  }
  module Spacing = {
    type spacing = int
    let spacing = spacing => #px(spacing * 8)
  }

  module Radius = {
    type radius = int
    let radius = radius => #px(radius * 8)
  }

  module ZIndex = {
    type zIndex = int

    let zIndex = v => v
  }

  module Colors = {
    type colors = AncestorCss_Types.Color.t

    let colors = v => v
  }
}

include Make(
  Defaults.Breakpoints,
  Defaults.Colors,
  Defaults.Spacing,
  Defaults.Radius,
  Defaults.ZIndex,
)

/*
 * We need to expose the breakpoints record for the compiler.
 */
include Defaults.Breakpoints
