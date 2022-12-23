module Make = (Config: Ancestor_Config.T) => {
  let createBreakpointSize = device => `${device->Config.sizeByBreakpoints->Belt.Int.toString}px`

  let mediaQuery = (current, device: Config.fields, styles) =>
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
    maybeCssValues
    ->Belt.Option.map(values =>
      values
      ->Config.encode
      ->filterEmptyValues
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Belt.Array.reduce("", mergeStyles(cssKey, stringify))
    )
    ->Belt.Option.getWithDefault("")

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

  let createPseudoStyle = (pseudoKey, maybeStyles) =>
    maybeStyles
    ->Belt.Option.map(styles =>
      `${pseudoKey} {
      ${styles->Css.propertiesToString}
    }`
    )
    ->Belt.Option.getWithDefault("")

  let createPseudoStyles = (
    ~_hover: option<Css.properties>=?,
    ~_focus: option<Css.properties>=?,
    ~_active: option<Css.properties>=?,
    ~_focusWithin: option<Css.properties>=?,
    ~_focusVisible: option<Css.properties>=?,
    ~_disabled: option<Css.properties>=?,
    ~_before: option<Css.properties>=?,
    ~_after: option<Css.properties>=?,
    ~_even: option<Css.properties>=?,
    ~_odd: option<Css.properties>=?,
    ~_first: option<Css.properties>=?,
    ~_last: option<Css.properties>=?,
    ~_notFirst: option<Css.properties>=?,
    ~_notLast: option<Css.properties>=?,
    (),
  ) => {
    let s = createPseudoStyle
    [
      s("&:hover", _hover),
      s("&:focus", _focus),
      s("&:active", _active),
      s("&:focus-within", _focusWithin),
      s("&:focus-visible", _focusVisible),
      s("&[disabled]", _disabled),
      s("&::before", _before),
      s("&::after", _after),
      s("&:nth-of-type(even)", _even),
      s("&:nth-of-type(odd)", _odd),
      s("&:first-of-type", _first),
      s("&:last-of-type", _last),
      s("&:not(:first-of-type)", _notFirst),
      s("&:not(:last-of-type)", _notLast),
    ]->Js.Array2.joinWith("\n")
  }

  let merge = styles => styles->Js.Array2.joinWith("")
}
