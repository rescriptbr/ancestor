include Ancestor_Core

module Defaults = {
  module Breakpoints = {
    type breakpoints<'a> = {
      xs?: 'a,
      sm?: 'a,
      md?: 'a,
      lg?: 'a,
      xl?: 'a,
    }
    type keyOfBreakpoints = AncestorCss.Defaults.Breakpoints.breakpoints
    let encode = breakpoints => [
      (#xs, breakpoints.xs),
      (#sm, breakpoints.sm),
      (#md, breakpoints.md),
      (#lg, breakpoints.lg),
      (#xl, breakpoints.xl),
    ]
    let sizeByBreakpoints = AncestorCss.Defaults.Breakpoints.sizeByBreakpoints
  }
  module Spacing = AncestorCss.Defaults.Spacing
  module Radius = AncestorCss.Defaults.Radius
  module ZIndex = AncestorCss.Defaults.ZIndex
  module Colors = AncestorCss.Defaults.Colors
  module FontSize = AncestorCss.Defaults.FontSize
  module FontWeight = AncestorCss.Defaults.FontWeight
  module FontFamily = AncestorCss.Defaults.FontFamily
  module LineHeight = AncestorCss.Defaults.LineHeight
  module LetterSpacing = AncestorCss.Defaults.LetterSpacing
  module Typography = AncestorCss.Defaults.Typography
  module Shadows = AncestorCss.Defaults.Shadows
}

include Make(
  Defaults.Breakpoints,
  Defaults.Colors,
  Defaults.Spacing,
  Defaults.Radius,
  Defaults.ZIndex,
  Defaults.Typography,
  Defaults.Shadows,
)

/*
 * We need to expose the breakpoints record for the compiler.
 */
include Defaults.Breakpoints
