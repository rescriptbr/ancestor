module Make = (
  BreakpointsConfig: Ancestor_Config.Breakpoints,
  ColorsConfig: AncestorCss_Config.Colors,
  SpacingConfig: AncestorCss_Config.Spacing,
  RadiusConfig: AncestorCss_Config.Radius,
  ZIndexConfig: AncestorCss_Config.ZIndex,
  TypographyConfig: AncestorCss_Config.Typography,
  ShadowsConfig: AncestorCss_Config.Shadows,
) => {
  module Config__Internal = {
    include BreakpointsConfig
    include ColorsConfig
    include SpacingConfig
    include RadiusConfig
    include ZIndexConfig
    include TypographyConfig
    include ShadowsConfig
  }

  module Styles = Ancestor_Styles.Make(Config__Internal)
  /**
   * Components
   */
  module Base = Ancestor_Base.Make(Config__Internal)
  module Box = Ancestor_Box.Make(Config__Internal)
  module Grid = Ancestor_Grid.Make(Config__Internal)
  module Hidden = Ancestor_Hidden.Make(Config__Internal)
  module Stack = Ancestor_Stack.Make(Config__Internal)
  module Typography = Base
  module Css = Styles.Css
  module ResponsiveValueHook = Ancestor_ResponsiveValueHook.Make(Config__Internal)

  /**
   * Exposing Ancestor hooks
   */
  let {useResponsiveValue} = module(ResponsiveValueHook)
}
