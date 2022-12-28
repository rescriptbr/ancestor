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

let defaultColors = (token: colors) =>
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
  }
