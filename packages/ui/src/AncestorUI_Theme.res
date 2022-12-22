type colors = [
  | #primary100
]

type theme = {
  /*
   * Tokens
   */
  colors: colors => Ancestor_Css.Color.t,
  /*
   * Components
   */
  button: AncestorUI_ButtonTokens.t,
}

type custom = {
  /*
   * Tokens
   */
  colors?: colors => Ancestor_Css.Color.t,
  /*
   * Components
   */
  button?: AncestorUI_ButtonTokens.t,
}

let default: theme = {
  colors: token =>
    switch token {
    | #primary100 => #hex("#fafafa")
    },
  button: AncestorUI_ButtonTokens.defaults,
}

module type T = {
  let theme: custom
}
