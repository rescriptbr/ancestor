module Make = (BreakpointsConfig: Ancestor_Config.Breakpoints) => {
  module Internal__Ancestor = Ancestor.Make(
    BreakpointsConfig,
    Theme.Colors,
    Ancestor.Defaults.Spacing,
    Ancestor.Defaults.Radius,
    Ancestor.Defaults.ZIndex,
  )
}
