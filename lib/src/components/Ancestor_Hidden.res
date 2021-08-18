module type HiddenMaker = {
  type breakpoints<'a>

  let sizeByBreakpoints: breakpoints<'value> => int
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let mediaQuery: (string, breakpoints<'a>, string) => string
  let css: string => string
}

module Make = (Maker: Ancestor_Styles.Maker) => {
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
