module Make = (
  // Config
  BreakpointsConfig: Ancestor_Config.Breakpoints,
  ColorsConfig: Theme.CustomColorsConfig,
  SpacingConfig: AncestorCss_Config.Spacing,
  RadiusConfig: AncestorCss_Config.Radius,
  ZIndexConfig: AncestorCss_Config.ZIndex,
  Theme: Theme.T,
) => {
  module Config = {
    include BreakpointsConfig
    include ColorsConfig
    include SpacingConfig
    include RadiusConfig
    include ZIndexConfig
    include Theme
  }
  module Button = Button.Make(Config)
}
