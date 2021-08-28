module Make = (Maker: Ancestor_StylesMaker.T) => {
  module Styles = Ancestor_Styles.Make(Maker)

  let createStyle = (styles, value) =>
    Styles.mediaQuery(
      styles,
      value,
      `
        display: ${Maker.unboxBreakpointValue(value) ? "none" : "block"};
      `,
    )

  let createHiddenClassName = on =>
    on
    ->Belt.Option.map(values =>
      values->Js.Array2.sortInPlaceWith(Styles.sortBySize)->Belt.Array.reduce("", createStyle)
    )
    ->Belt.Option.getWithDefault("")
    ->Maker.css

  @react.component
  let make = (~on: option<array<Maker.breakpoints<bool>>>=?, ~children) => {
    <div className={createHiddenClassName(on)}> children </div>
  }
}
