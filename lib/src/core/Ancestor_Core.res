module Make = (StylesMaker: Ancestor_Styles.Maker) => {
  module Styles = Ancestor_Styles.Make(StylesMaker)
  module Base = Ancestor_Base.Make(StylesMaker)
  module Box = Ancestor_Box.Make(StylesMaker)
  module Grid = Ancestor_Grid.Make(StylesMaker)
  module Hidden = Ancestor_Hidden.Make(StylesMaker)
}
