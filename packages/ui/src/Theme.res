module Colors = {
  type colors = [#primary]
  let colors = token =>
    switch token {
    | #primary => #hex("#fc0")
    }
}
