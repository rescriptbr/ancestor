type size = [
  | #lg
  | #md
  | #sm
]

type color = [
  | #primary
]

type sizeStyles = {
  fontSize: Ancestor_Css.Length.t,
  height: Ancestor_Css.Length.t,
}

type sizeStylesPartial = {
  fontSize?: Ancestor_Css.Length.t,
  height?: Ancestor_Css.Length.t,
}

type t = {
  lg: sizeStyles,
  md: sizeStyles,
  sm: sizeStyles,
}

type custom = {
  lg?: sizeStylesPartial,
  md?: sizeStylesPartial,
  sm?: sizeStylesPartial,
}

let defaults: t = {
  lg: {
    height: #px(50),
    fontSize: #rem(1.8),
  },
  md: {
    height: #px(42),
    fontSize: #rem(1.8),
  },
  sm: {
    height: #px(34),
    fontSize: #px(14),
  },
}
