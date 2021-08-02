module type HiddenMaker = {
  type breakpoints<'a>

  let sizeByBreakpoints: breakpoints<'value> => int
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let greaterThan: (string, breakpoints<'a>, string) => string
}

module Make = (Maker: HiddenMaker) => {
  type mode = [#css | #js]

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

  @react.component
  let make = (~on: option<array<Maker.breakpoints<bool>>>=?, ~mode: mode=#css, ~children) => {
    let className = switch mode {
    | #js => ""
    | #css =>
      on
      ->Belt.Option.map(values =>
        values->Js.Array2.sortInPlaceWith(sortBySize)->Belt.Array.reduce("", createStyle)
      )
      ->Belt.Option.getWithDefault("")
      ->Ancestor_Emotion.css
    }

    <div className> children </div>
  }
}
