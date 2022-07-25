module Make = (Config: Ancestor_Config.T) => {
  module Styles = Ancestor_Styles.Make(Config)

  @val external window: Dom.window = "window"
  @get external innerWidth: Dom.window => int = "innerWidth"
  @send external addEventListener: (Dom.window, string, unit => unit) => unit = "addEventListener"

  let initialWidth = window->innerWidth

  let getBreakpointValue = (innerWidth, values: Styles.responsiveProp<'a>) =>
    values->Js.Array2.reduce((acc, value) => {
      let breakpoint = value->Config.sizeByBreakpoints
      if innerWidth >= breakpoint {
        Some(value)
      } else {
        acc
      }
    }, None)->Belt.Option.map(Config.unboxBreakpointValue)

  let useResponsiveValueExn = values => {
    let (width, setWidth) = React.useState(_ => initialWidth)

    React.useEffect0(() => {
      window->addEventListener("resize", () => {
        setWidth(_ => window->innerWidth)
      })

      None
    })

    getBreakpointValue(width, values)->Belt.Option.getExn
  }

  let useResponsiveValue = (default, values) => {
    Js.log(initialWidth)
    let (width, setWidth) = React.useState(_ => initialWidth)

    React.useEffect0(() => {
      window->addEventListener("resize", () => {
        setWidth(_ => window->innerWidth)
      })

      None
    })

    getBreakpointValue(width, values)->Belt.Option.getWithDefault(default)
  }
}
