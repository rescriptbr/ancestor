module Make = (
  BreakpointsConfig: Ancestor_Config.Breakpoints,
  ColorsConfig: Ancestor_Config.Colors,
  SpacingConfig: Ancestor_Config.Spacing,
  RadiusConfig: Ancestor_Config.Radius,
  ZIndexConfig: Ancestor_Config.ZIndex,
) => {
  module Config__Internal = {
    include BreakpointsConfig
    include ColorsConfig
    include SpacingConfig
    include RadiusConfig
    include ZIndexConfig
  }

  module Styles = Ancestor_Styles.Make(Config__Internal)
  module Base = Ancestor_Base.Make(Config__Internal)
  module Box = Ancestor_Box.Make(Config__Internal)
  module Grid = Ancestor_Grid.Make(Config__Internal)
  module Hidden = Ancestor_Hidden.Make(Config__Internal)
  module Stack = Ancestor_Stack.Make(Config__Internal)
  module Typography = Base
  module Css = Styles.Css
  module ResponsiveValueHook = Ancestor_ResponsiveValueHook.Make(Config__Internal)

  let {useResponsiveValue} = module(ResponsiveValueHook)
}
