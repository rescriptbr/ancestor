module Colors = {
  type colors = [#primary | #secondary]

  let colors = token =>
    switch token {
    | #primary => #hex("#fc0")
    | #secondary => #hex("#ccc")
    }
}

module Css = AncestorCss.Make(
  Ancestor.Defaults.Spacing,
  Ancestor.Defaults.Radius,
  Colors,
  Ancestor.Defaults.ZIndex,
  AncestorCss_Parsers.Simple,
)

let useCss = Css.useCss
