module Make = (CssConfig: Css.T) => {
  module Css = Css.Make(CssConfig)
  type size = [
    | #lg
    | #md
    | #sm
  ]

  type color = [
    | #primary
  ]

  type sizes = {
    lg?: Css.properties,
    md?: Css.properties,
    sm?: Css.properties,
  }

  type t = {sizes?: sizes, baseStyles?: Css.properties}
}
