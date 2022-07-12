module Make = (Config: Ancestor_Config.T) => {
  module Styles = Ancestor_Styles.Make(Config)
  module Base = Ancestor_Base.Make(Config)
  module Box = Ancestor_Box.Make(Config)
  module Grid = Ancestor_Grid.Make(Config)
  module Hidden = Ancestor_Hidden.Make(Config)
  module Css = Ancestor_Css.Make({
    type spacing = Config.spacing
    let spacing = Config.spacing
  })
  module Typography = Base
}
