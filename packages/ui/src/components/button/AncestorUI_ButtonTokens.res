type size = [
  | #lg
  | #md
  | #sm
]

type sizeStyles = {
  fontSize: Ancestor_Css.Length.t,
  height: Ancestor_Css.Length.t,
}

type t = {sizes: size => sizeStyles}

type custom = {sizes?: size => sizeStyles}

let tmpSize = {
  fontSize: #px(20),
  height: #px(52),
}
let defaults: t = {
  sizes: token =>
    switch token {
    | #lg => tmpSize
    | #md => tmpSize
    | #sm => tmpSize
    },
}
