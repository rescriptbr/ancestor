module Make = (Config: Ancestor_Config.T) => {
  module Styles = Ancestor_Styles.Make(Config)

  let createStyle = (styles, value) =>
    Styles.mediaQuery(
      styles,
      value,
      `
        display: ${Config.unboxBreakpointValue(value) ? "none" : "block"};
      `,
    )

  let createHiddenClassName = on =>
    on
    ->Belt.Option.map(values =>
      values->Js.Array2.sortInPlaceWith(Styles.sortBySize)->Belt.Array.reduce("", createStyle)
    )
    ->Belt.Option.getWithDefault("")
    ->Config.css

  @react.component
  let make = (~on: option<array<Config.breakpoints<bool>>>=?, ~children) => {
    <div className={createHiddenClassName(on)}> children </div>
  }
}
