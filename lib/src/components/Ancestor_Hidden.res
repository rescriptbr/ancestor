module type HiddenMaker = {
  type breakpoints<'a>

  let sizeByBreakpoints: breakpoints<'value> => int
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let greaterThan: (string, breakpoints<'a>, string) => string
  let css: string => string
}

module Make = (Maker: HiddenMaker) => {
  let sortBySize = (a, b) => Maker.sizeByBreakpoints(a) - Maker.sizeByBreakpoints(b)

  let createStyle = (styles, value) =>
    Maker.greaterThan(
      styles,
      value,
      `
        > * {
          display: ${Maker.unboxBreakpointValue(value) ? "none" : "block"};
        }
      `,
    )

  let createHiddenClassName = on =>
    on
    ->Belt.Option.map(values =>
      values->Js.Array2.sortInPlaceWith(sortBySize)->Belt.Array.reduce("", createStyle)
    )
    ->Belt.Option.getWithDefault("")
    ->Maker.css

  @react.component
  let make = (~on: option<array<Maker.breakpoints<bool>>>=?, ~children) => {
    <div className={createHiddenClassName(on)}> children </div>
  }
}
