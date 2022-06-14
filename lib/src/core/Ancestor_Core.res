module Make = (StylesMaker: Ancestor_StylesMaker.T) => {
  module Styles = Ancestor_Styles.Make(StylesMaker)
  module Base = Ancestor_Base.Make(StylesMaker)
  module Box = Ancestor_Box.Make(StylesMaker)
  module Grid = Ancestor_Grid.Make(StylesMaker)
  module Hidden = Ancestor_Hidden.Make(StylesMaker)
  module CssTypes = Ancestor_CssTypes
  module Spacing = Styles.Spacing
  module Radius = Styles.Radius
  module Typography = Base
  module Stack = Ancestor_Stack.Make(StylesMaker)
}
