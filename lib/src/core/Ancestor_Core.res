module type AncestorCoreMaker = {
  type breakpoints<'value>

  let spacing: float
  let sizeByBreakpoints: breakpoints<'value> => int
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let css: string => string
}

module Make = (Maker: AncestorCoreMaker) => {
  module StylesMaker = {
    type breakpoints<'a> = Maker.breakpoints<'a>
    let spacing = Maker.spacing
    let unboxBreakpointValue = Maker.unboxBreakpointValue
    let sizeByBreakpoints = Maker.sizeByBreakpoints
    let css = Maker.css
  }

  module Styles = Ancestor_Styles.Make(StylesMaker)
  module Base = Ancestor_Base.Make(StylesMaker)
  module Box = Ancestor_Box.Make(StylesMaker)
  module Grid = Ancestor_Grid.Make(StylesMaker)
  module Hidden = Ancestor_Hidden.Make(StylesMaker)
}
