type color = [
  | #primary
  | #secondary
]

type api<'unsafe> = {baseStyle: Css.t<'unsafe>}
