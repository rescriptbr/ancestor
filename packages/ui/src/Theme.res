module type CustomColors = {
  type t
  let make: t => AncestorCss_Types.Color.t
}

module Colors = (Custom: CustomColors) => {
  type colors = [#primary | #secondary | #custom(Custom.t)]

  let colors = token =>
    switch token {
    | #primary => #hex("#fc0")
    | #secondary => #hex("#ccc")
    | #custom(color) => Custom.make(color)
    }
}
