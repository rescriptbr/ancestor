module Make = (Config: Ancestor_Config.T) => {
  module Css = Ancestor_Css.Make({
    type spacing = Config.spacing
    let spacing = Config.spacing

    type colors = Config.colors
    let colors = Config.colors
  })

  open Css

  let radius = v => v->Config.radius->Length.toString
  let spacing = v => v->Config.spacing->Length.toString
  let colors = v => v->Config.colors->Color.toString

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

  let createCssValueFromArray = (cssKey, maybeCssValues, stringify) =>
    maybeCssValues
    ->Belt.Option.map(values =>
      values
      ->Config.encode
      ->filterEmptyValues
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Belt.Array.reduce("", mergeStyles(cssKey, stringify))
    )
    ->Belt.Option.getWithDefault("")

  let createResponsiveStyles = (
    ~borderRadius: option<Config.breakpoints<Config.radius>>=?,
    ~borderTLRadius: option<Config.breakpoints<Config.radius>>=?,
    ~borderTRRadius: option<Config.breakpoints<Config.radius>>=?,
    ~borderBLRadius: option<Config.breakpoints<Config.radius>>=?,
    ~borderBRRadius: option<Config.breakpoints<Config.radius>>=?,
    ~borderStyle: option<Config.breakpoints<BorderStyle.t>>=?,
    ~borderColor: option<Config.breakpoints<Config.colors>>=?,
    ~borderWidth: option<Config.breakpoints<Length.t>>=?,
    ~border: option<Config.breakpoints<Border.t>>=?,
    ~borderRight: option<Config.breakpoints<Border.t>>=?,
    ~borderLeft: option<Config.breakpoints<Border.t>>=?,
    ~borderTop: option<Config.breakpoints<Border.t>>=?,
    ~borderBottom: option<Config.breakpoints<Border.t>>=?,
    ~borderRightStyle: option<Config.breakpoints<BorderStyle.t>>=?,
    ~borderLeftStyle: option<Config.breakpoints<BorderStyle.t>>=?,
    ~borderTopStyle: option<Config.breakpoints<BorderStyle.t>>=?,
    ~borderBottomStyle: option<Config.breakpoints<BorderStyle.t>>=?,
    ~borderRightColor: option<Config.breakpoints<Config.colors>>=?,
    ~borderLeftColor: option<Config.breakpoints<Config.colors>>=?,
    ~borderTopColor: option<Config.breakpoints<Config.colors>>=?,
    ~borderBottomColor: option<Config.breakpoints<Config.colors>>=?,
    ~borderRightWidth: option<Config.breakpoints<Length.t>>=?,
    ~borderLeftWidth: option<Config.breakpoints<Length.t>>=?,
    ~borderTopWidth: option<Config.breakpoints<Length.t>>=?,
    ~borderBottomWidth: option<Config.breakpoints<Length.t>>=?,
    ~bgColor: option<Config.breakpoints<Config.colors>>=?,
    ~bgSize: option<Config.breakpoints<BackgroundSize.t>>=?,
    ~bgPosition: option<Config.breakpoints<BackgroundPosition.t>>=?,
    ~bgImage: option<Config.breakpoints<BackgroundImage.t>>=?,
    ~color: option<Config.breakpoints<Config.colors>>=?,
    ~display: option<Config.breakpoints<Display.t>>=?,
    ~justifyContent: option<Config.breakpoints<JustifyContent.t>>=?,
    ~flexDirection: option<Config.breakpoints<FlexDirection.t>>=?,
    ~alignItems: option<Config.breakpoints<AlignItems.t>>=?,
    ~flexBasis: option<Config.breakpoints<FlexBasis.t>>=?,
    ~flexWrap: option<Config.breakpoints<FlexWrap.t>>=?,
    ~flexGrow: option<Config.breakpoints<FlexGrow.t>>=?,
    ~alignContent: option<Config.breakpoints<AlignContent.t>>=?,
    ~alignSelf: option<Config.breakpoints<AlignSelf.t>>=?,
    ~justifySelf: option<Config.breakpoints<JustifySelf.t>>=?,
    ~flexFlow: option<Config.breakpoints<FlexFlow.t>>=?,
    ~gap: option<Config.breakpoints<Gap.t>>=?,
    ~p: option<Config.breakpoints<Config.spacing>>=?,
    ~px: option<Config.breakpoints<Config.spacing>>=?,
    ~py: option<Config.breakpoints<Config.spacing>>=?,
    ~pt: option<Config.breakpoints<Config.spacing>>=?,
    ~pb: option<Config.breakpoints<Config.spacing>>=?,
    ~pl: option<Config.breakpoints<Config.spacing>>=?,
    ~pr: option<Config.breakpoints<Config.spacing>>=?,
    ~m: option<Config.breakpoints<Config.spacing>>=?,
    ~mx: option<Config.breakpoints<Config.spacing>>=?,
    ~my: option<Config.breakpoints<Config.spacing>>=?,
    ~mt: option<Config.breakpoints<Config.spacing>>=?,
    ~mb: option<Config.breakpoints<Config.spacing>>=?,
    ~ml: option<Config.breakpoints<Config.spacing>>=?,
    ~mr: option<Config.breakpoints<Config.spacing>>=?,
    ~textAlign: option<Config.breakpoints<TextAlign.t>>=?,
    ~fontFamily: option<Config.breakpoints<FontFamily.t>>=?,
    ~fontWeight: option<Config.breakpoints<FontWeight.t>>=?,
    ~fontSize: option<Config.breakpoints<Length.t>>=?,
    ~letterSpacing: option<Config.breakpoints<Length.t>>=?,
    ~lineHeight: option<Config.breakpoints<Length.t>>=?,
    ~width: option<Config.breakpoints<Length.t>>=?,
    ~height: option<Config.breakpoints<Length.t>>=?,
    ~minW: option<Config.breakpoints<Length.t>>=?,
    ~minH: option<Config.breakpoints<Length.t>>=?,
    ~maxW: option<Config.breakpoints<Length.t>>=?,
    ~maxH: option<Config.breakpoints<Length.t>>=?,
    ~position: option<Config.breakpoints<Position.t>>=?,
    ~top: option<Config.breakpoints<Length.t>>=?,
    ~bottom: option<Config.breakpoints<Length.t>>=?,
    ~left: option<Config.breakpoints<Length.t>>=?,
    ~right: option<Config.breakpoints<Length.t>>=?,
    ~zIndex: option<Config.breakpoints<Config.zIndex>>=?,
    ~boxSizing: option<Config.breakpoints<BoxSizing.t>>=?,
    ~overflow: option<Config.breakpoints<Overflow.t>>=?,
    ~overflowX: option<Config.breakpoints<Overflow.t>>=?,
    ~overflowY: option<Config.breakpoints<Overflow.t>>=?,
    ~cursor: option<Config.breakpoints<Cursor.t>>=?,
    ~visibility: option<Config.breakpoints<Visibility.t>>=?,
    ~listStyleType: option<Config.breakpoints<ListStyleType.t>>=?,
    ~listStylePosition: option<Config.breakpoints<ListStylePosition.t>>=?,
    ~listStyleImage: option<Config.breakpoints<ListStyleImage.t>>=?,
    ~listStyle: option<Config.breakpoints<ListStyle.t>>=?,
    ~outlineStyle: option<Config.breakpoints<OutlineStyle.t>>=?,
    ~outline: option<Config.breakpoints<Outline.t>>=?,
    ~textDecorationStyle: option<Config.breakpoints<TextDecorationStyle.t>>=?,
    ~textDecorationLine: option<Config.breakpoints<TextDecorationLine.t>>=?,
    ~textDecoration: option<Config.breakpoints<TextDecoration.t>>=?,
    ~transform: option<Config.breakpoints<Transform.t>>=?,
    (),
  ) =>
    [
      createCssValueFromArray("border-radius", borderRadius, radius),
      createCssValueFromArray("border-top-left-radius", borderTLRadius, radius),
      createCssValueFromArray("border-top-right-radius", borderTRRadius, radius),
      createCssValueFromArray("border-bottom-left-radius", borderBLRadius, radius),
      createCssValueFromArray("border-bottom-right-radius", borderBRRadius, radius),
      createCssValueFromArray("border-style", borderStyle, BorderStyle.toString),
      createCssValueFromArray("border-color", borderColor, colors),
      createCssValueFromArray("border-width", borderWidth, Length.toString),
      createCssValueFromArray("border", border, Border.toString),
      createCssValueFromArray("border-right", borderRight, Border.toString),
      createCssValueFromArray("border-left", borderLeft, Border.toString),
      createCssValueFromArray("border-top", borderTop, Border.toString),
      createCssValueFromArray("border-bottom", borderBottom, Border.toString),
      createCssValueFromArray("border-right-style", borderRightStyle, BorderStyle.toString),
      createCssValueFromArray("border-left-style", borderLeftStyle, BorderStyle.toString),
      createCssValueFromArray("border-top-style", borderTopStyle, BorderStyle.toString),
      createCssValueFromArray("border-bottom-style", borderBottomStyle, BorderStyle.toString),
      createCssValueFromArray("border-right-color", borderRightColor, colors),
      createCssValueFromArray("border-left-color", borderLeftColor, colors),
      createCssValueFromArray("border-top-color", borderTopColor, colors),
      createCssValueFromArray("border-bottom-color", borderBottomColor, colors),
      createCssValueFromArray("border-right-width", borderRightWidth, Length.toString),
      createCssValueFromArray("border-left-width", borderLeftWidth, Length.toString),
      createCssValueFromArray("border-top-width", borderTopWidth, Length.toString),
      createCssValueFromArray("border-bottom-width", borderBottomWidth, Length.toString),
      createCssValueFromArray("background-color", bgColor, colors),
      createCssValueFromArray("background-size", bgSize, BackgroundSize.toString),
      createCssValueFromArray("background-position", bgPosition, BackgroundPosition.toString),
      createCssValueFromArray("background-image", bgImage, BackgroundImage.toString),
      createCssValueFromArray("color", color, colors),
      createCssValueFromArray("display", display, Display.toString),
      createCssValueFromArray("justify-content", justifyContent, JustifyContent.toString),
      createCssValueFromArray("align-items", alignItems, AlignItems.toString),
      createCssValueFromArray("flex-direction", flexDirection, FlexDirection.toString),
      createCssValueFromArray("flex-basis", flexBasis, FlexBasis.toString),
      createCssValueFromArray("flex-wrap", flexWrap, FlexWrap.toString),
      createCssValueFromArray("flex-grow", flexGrow, FlexGrow.toString),
      createCssValueFromArray("align-content", alignContent, AlignContent.toString),
      createCssValueFromArray("align-self", alignSelf, AlignSelf.toString),
      createCssValueFromArray("justify-self", justifySelf, JustifySelf.toString),
      createCssValueFromArray("flex-flow", flexFlow, FlexFlow.toString),
      createCssValueFromArray("gap", gap, Gap.toString),
      createCssValueFromArray("padding", p, spacing),
      createCssValueFromArray("padding-left", px, spacing),
      createCssValueFromArray("padding-right", px, spacing),
      createCssValueFromArray("padding-top", py, spacing),
      createCssValueFromArray("padding-bottom", py, spacing),
      createCssValueFromArray("padding-top", pt, spacing),
      createCssValueFromArray("padding-bottom", pb, spacing),
      createCssValueFromArray("padding-left", pl, spacing),
      createCssValueFromArray("padding-right", pr, spacing),
      createCssValueFromArray("margin", m, spacing),
      createCssValueFromArray("margin-left", mx, spacing),
      createCssValueFromArray("margin-right", mx, spacing),
      createCssValueFromArray("margin-top", my, spacing),
      createCssValueFromArray("margin-bottom", my, spacing),
      createCssValueFromArray("margin-top", mt, spacing),
      createCssValueFromArray("margin-bottom", mb, spacing),
      createCssValueFromArray("margin-left", ml, spacing),
      createCssValueFromArray("margin-right", mr, spacing),
      createCssValueFromArray("text-align", textAlign, TextAlign.toString),
      createCssValueFromArray("font-family", fontFamily, FontFamily.toString),
      createCssValueFromArray("font-weight", fontWeight, FontWeight.toString),
      createCssValueFromArray("font-size", fontSize, Length.toString),
      createCssValueFromArray("letter-spacing", letterSpacing, Length.toString),
      createCssValueFromArray("line-height", lineHeight, Length.toString),
      createCssValueFromArray("width", width, Length.toString),
      createCssValueFromArray("height", height, Length.toString),
      createCssValueFromArray("min-width", minW, Length.toString),
      createCssValueFromArray("min-height", minH, Length.toString),
      createCssValueFromArray("max-width", maxW, Length.toString),
      createCssValueFromArray("max-height", maxH, Length.toString),
      createCssValueFromArray("position", position, Position.toString),
      createCssValueFromArray("top", top, Length.toString),
      createCssValueFromArray("bottom", bottom, Length.toString),
      createCssValueFromArray("left", left, Length.toString),
      createCssValueFromArray("right", right, Length.toString),
      createCssValueFromArray("z-index", zIndex, v => v->Config.zIndex->ZIndex.toString),
      createCssValueFromArray("box-sizing", boxSizing, BoxSizing.toString),
      createCssValueFromArray("overflow", overflow, Overflow.toString),
      createCssValueFromArray("overflow-x", overflowX, Overflow.toString),
      createCssValueFromArray("overflow-y", overflowY, Overflow.toString),
      createCssValueFromArray("cursor", cursor, Cursor.toString),
      createCssValueFromArray("visibility", visibility, Visibility.toString),
      createCssValueFromArray("list-style-type", listStyleType, ListStyleType.toString),
      createCssValueFromArray("list-style-position", listStylePosition, ListStylePosition.toString),
      createCssValueFromArray("list-style-image", listStyleImage, ListStyleImage.toString),
      createCssValueFromArray("list-style", listStyle, ListStyle.toString),
      createCssValueFromArray("outline-style", outlineStyle, OutlineStyle.toString),
      createCssValueFromArray("outline", outline, Outline.toString),
      createCssValueFromArray(
        "text-decoration-style",
        textDecorationStyle,
        TextDecorationStyle.toString,
      ),
      createCssValueFromArray(
        "text-decoration-line",
        textDecorationLine,
        TextDecorationLine.toString,
      ),
      createCssValueFromArray("text-decoration", textDecoration, TextDecoration.toString),
      createCssValueFromArray("transform", transform, Transform.toString),
    ]->Js.Array2.joinWith("")

  let merge = styles => styles->Js.Array2.joinWith("")
}
