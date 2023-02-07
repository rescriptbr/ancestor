module Make = (
  ColorsConfig: Theme.CustomColors,
  BreakpointsConfig: Ancestor_Config.Breakpoints,
) => {
  module Config = {
    include BreakpointsConfig
    include Theme.Colors(ColorsConfig)
    include Ancestor.Defaults.Spacing
    include Ancestor.Defaults.Radius
    include Ancestor.Defaults.ZIndex
  }

  module Core = AncestorCore.Make(Config)
}
