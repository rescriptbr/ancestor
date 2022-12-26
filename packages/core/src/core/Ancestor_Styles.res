module Make = (Config: Ancestor_Config.T) => {
  let createBreakpointSize = device => `${device->Config.sizeByBreakpoints->Belt.Int.toString}px`

  let mediaQuery = (current, device: Config.breakpoints_keyOf, styles) =>
    `
    ${current}
    @media (min-width: ${device->createBreakpointSize}) {
      ${styles}
    }
  `

  let filterEmptyValues = values =>
    values->Js.Array2.reduce((values, (breakpointName, breakpointValue)) => {
      switch breakpointValue {
      | None => values
      | Some(breakpointValue) => values->Js.Array2.concat([(breakpointName, breakpointValue)])
      }
    }, [])

  let sortBySize = ((first, _), (second, _)) => {
    Config.sizeByBreakpoints(first) - Config.sizeByBreakpoints(second)
  }

  let mergeStyles = (cssKey, stringify, styles, (breakpointName, breakpointValue)) =>
    mediaQuery(styles, breakpointName, `${cssKey}: ${breakpointValue->stringify};`)

  /**
   * Creates responsive styles for responsive props.
   * It's used to create responsive props in components like Box or Stack.
   * Check out Ancestor_Stack.res to see more.
   */
  let createResponsiveProp = (~prop, ~defaultStyles="", transform) => {
    switch prop {
    | None => defaultStyles
    | Some(values) =>
      values
      ->Config.encode
      ->filterEmptyValues
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Js.Array2.reduce((currentStyles, (breakpoint, value)) => {
        mediaQuery(currentStyles, breakpoint, transform(value))
      }, "")
    }
  }

  let createResponsiveValue = (cssKey, maybeCssValues, stringify) =>
    maybeCssValues->Belt.Option.map(values =>
      values
      ->Config.encode
      ->filterEmptyValues
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Belt.Array.reduce("", mergeStyles(cssKey, stringify))
    )

  module Css = Ancestor_Css.Make({
    type spacing = Config.spacing
    let spacing = Config.spacing

    type colors = Config.colors
    let colors = Config.colors

    type radius = Config.radius
    let radius = Config.radius

    type zIndex = Config.zIndex
    let zIndex = Config.zIndex

    type propsWrapper<'value> = Config.breakpoints<'value>
    let propsTransformer = createResponsiveValue
  })

  let merge = styles => styles->Js.Array2.joinWith("")
}
