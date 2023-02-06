module Colors = {
  type colors = [#primary | #secondary]

  let colors = token =>
    switch token {
    | #primary => #hex("#fc0")
    | #secondary => #hex("#ccc")
    }
}

type theme = {colors: Colors.colors => AncestorCss_Types.Color.t}

module type T = {
  let useTheme: unit => theme
}
