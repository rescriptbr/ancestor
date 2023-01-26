module Make = (
  BreakpointsConfig: Ancestor_Config.Breakpoints,
  ColorsConfig: AncestorCss_Config.Colors,
  SpacingConfig: AncestorCss_Config.Spacing,
  RadiusConfig: AncestorCss_Config.Radius,
  ZIndexConfig: AncestorCss_Config.ZIndex,
) => {
  module Config__Internal = {
    include BreakpointsConfig
    include ColorsConfig
    include SpacingConfig
    include RadiusConfig
    include ZIndexConfig
  }

  module Styles = Ancestor_Styles.Make(Config__Internal)
  module CssConfig = {
    let useCss = Styles.Css.useCss
  }
  /**
   *  NOTE: Internal components
   */
  module Internal__Base = Ancestor_Base.Make(Config__Internal)
  module Internal__Box = Ancestor_Box.Make(Config__Internal)
  module Internal__Grid = Ancestor_Grid.Make(Config__Internal)
  module Internal__Hidden = Ancestor_Hidden.Make(Config__Internal)
  module Internal__Stack = Ancestor_Stack.Make(Config__Internal)
  /**
   * Components
   */
  module Base = Internal__Base.Make(CssConfig)
  module Box = Internal__Box.Make(CssConfig)
  module Grid = Internal__Grid.Make(CssConfig)
  module Hidden = Internal__Hidden.Make(CssConfig)
  module Stack = Internal__Stack.Make(CssConfig)
  module Typography = Base
  module Css = Styles.Css
  module ResponsiveValueHook = Ancestor_ResponsiveValueHook.Make(Config__Internal)

  /**
   * Exposing Ancestor hooks
   */
  let {useResponsiveValue} = module(ResponsiveValueHook)
  let {useCss} = module(Styles.Css)
}
