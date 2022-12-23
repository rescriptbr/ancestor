module Make = (Config: Ancestor_Config.T) => {
  module Styles = Ancestor_Styles.Make(Config)
  module Base = Ancestor_Base.Make(Config)
  module Box = Ancestor_Box.Make(Config)
  module Grid = Ancestor_Grid.Make(Config)
  module Hidden = Ancestor_Hidden.Make(Config)
  module Stack = Ancestor_Stack.Make(Config)
  module Typography = Base
  module Css = Styles.Css
  module ResponsiveValueHook = Ancestor_ResponsiveValueHook.Make(Config)

  let {useResponsiveValue} = module(ResponsiveValueHook)
}
