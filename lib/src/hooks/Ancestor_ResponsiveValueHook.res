module Make = (Config: Ancestor_Config.T) => {
  module Styles = Ancestor_Styles.Make(Config)

  @val external window: option<Dom.window> = "window"
  @get external innerWidth: Dom.window => float = "innerWidth"
  @send external addEventListener: (Dom.window, string, unit => unit) => unit = "addEventListener"
  @send
  external removeEventListener: (Dom.window, string, unit => unit) => unit = "removeEventListener"

  let initialWidth = window->Belt.Option.map(w => w->innerWidth)

  let getBreakpointValue = (innerWidth, values: Styles.responsiveProp<'a>) =>
    values->Js.Array2.reduce((acc, value) => {
      let breakpoint = value->Config.sizeByBreakpoints
      if innerWidth >= breakpoint->Js.Int.toFloat {
        Some(value)
      } else {
        acc
      }
    }, None)->Belt.Option.map(Config.unboxBreakpointValue)

  let useResponsiveValue = (default, values) => {
    let (width, setWidth) = React.useState(_ => initialWidth)

    React.useEffect0(() => {
      let updateWidth = () => setWidth(_ => window->Belt.Option.map(w => w->innerWidth))

      window->Belt.Option.map(w => w->addEventListener("resize", updateWidth))->ignore

      Some(
        () => window->Belt.Option.map(w => w->removeEventListener("resize", updateWidth))->ignore,
      )
    })

    width
    ->Belt.Option.flatMap(width => getBreakpointValue(width, values))
    ->Belt.Option.getWithDefault(default)
  }
}
