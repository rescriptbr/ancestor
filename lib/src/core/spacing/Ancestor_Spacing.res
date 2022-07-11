module Make = (Maker: Ancestor_StylesMaker.T) => {
  type t = int

  let make = value =>
    `${(Js.Int.toFloat(value) *. Maker.spacing)->Js.Float.toFixedWithPrecision(~digits=1)}px`
}
