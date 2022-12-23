type colors = [
  | #primary100
  | #primary200
  | #primary300
  | #primary400
  | #primary500
  | #primary600
  | #primary700
  | #primary800
  | #primary900
]

type theme<'spacing> = {
  /*
   * Tokens
   */
  colors: colors => Ancestor_Css.Color.t,
  spacing: 'spacing => Ancestor_Css.Length.t,
  /*
   * Components
   */
  button: ButtonTokens.t,
}

type custom<'spacing> = {
  /*
   * Tokens
   */
  colors?: colors => Ancestor_Css.Color.t,
  spacing?: 'spacing => Ancestor_Css.Length.t,
  /*
   * Components
   */
  button?: ButtonTokens.custom,
}

let default: theme<float> = {
  spacing: v => #pxFloat(v *. 8.0),
  colors: token =>
    switch token {
    | #primary100 => #hex("#E1F3FE")
    | #primary200 => #hex("#BFE6FD")
    | #primary300 => #hex("#8ED3FB")
    | #primary400 => #hex("#5DC0F9")
    | #primary500 => #hex("#2BADF7")
    | #primary600 => #hex("#0996E7")
    | #primary700 => #hex("#0776B6")
    | #primary800 => #hex("#055685")
    | #primary900 => #hex("#033654")
    },
  button: ButtonTokens.defaults,
}

let mergeWithDefaults = (customTheme: custom<'spacing>): theme<'spacing> => {
  let mergeDeep = (theme, custom) => DeepMerge.merge(theme, custom)
  mergeDeep(default, customTheme)
}

module type Theme = {
  type spacing

  let theme: theme<spacing>
}

module type CustomTheme = {
  type spacing

  let theme: custom<spacing>
}
