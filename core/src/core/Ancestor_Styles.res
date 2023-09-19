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

  type responsiveProp<'a> = array<Config.breakpoints<'a>>

  let createBreakpointSize = device => `${device->Config.sizeByBreakpoints->Belt.Int.toString}px`

  let mediaQuery = (current, device: Config.breakpoints<'a>, styles) =>
    `
    ${current}
    @media (min-width: ${device->createBreakpointSize}) {
      ${styles}
    }
  `

  let sortBySize = (first, second) =>
    Config.sizeByBreakpoints(first) - Config.sizeByBreakpoints(second)

  let mergeStyles = (cssKey, stringify, styles, breakpointValue) =>
    mediaQuery(
      styles,
      breakpointValue,
      `${cssKey}: ${breakpointValue->Config.unboxBreakpointValue->stringify};`,
    )

  /**
   * Creates responsive styles for responsive props.
   * It's used to create responsive props in components like Box or Stack.
   * Check out Ancestor_Stack.res to see more.
   */
  let createResponsiveProp = (~prop, ~defaultStyles="", transform) => {
    switch prop {
    | None => defaultStyles
    | Some(values) =>
      values->Js.Array2.sortInPlaceWith(sortBySize)->Js.Array2.reduce((currentStyles, value) => {
        let parsed = value->Config.unboxBreakpointValue
        mediaQuery(currentStyles, value, transform(parsed))
      }, "")
    }
  }

  let createCssValueFromArray = (cssKey, maybeCssValues, stringify) =>
    maybeCssValues
    ->Belt.Option.map(values =>
      values
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Belt.Array.reduce("", mergeStyles(cssKey, stringify))
    )
    ->Belt.Option.getWithDefault("")

  type responsiveStyles = {
    borderRadius?: responsiveProp<Config.radius>,
    borderTLRadius?: responsiveProp<Config.radius>,
    borderTRRadius?: responsiveProp<Config.radius>,
    borderBLRadius?: responsiveProp<Config.radius>,
    borderBRRadius?: responsiveProp<Config.radius>,
    borderStyle?: responsiveProp<BorderStyle.t>,
    borderColor?: responsiveProp<Config.colors>,
    borderWidth?: responsiveProp<Length.t>,
    border?: responsiveProp<Border.t>,
    borderRight?: responsiveProp<Border.t>,
    borderLeft?: responsiveProp<Border.t>,
    borderTop?: responsiveProp<Border.t>,
    borderBottom?: responsiveProp<Border.t>,
    borderRightStyle?: responsiveProp<BorderStyle.t>,
    borderLeftStyle?: responsiveProp<BorderStyle.t>,
    borderTopStyle?: responsiveProp<BorderStyle.t>,
    borderBottomStyle?: responsiveProp<BorderStyle.t>,
    borderRightColor?: responsiveProp<Config.colors>,
    borderLeftColor?: responsiveProp<Config.colors>,
    borderTopColor?: responsiveProp<Config.colors>,
    borderBottomColor?: responsiveProp<Config.colors>,
    borderRightWidth?: responsiveProp<Length.t>,
    borderLeftWidth?: responsiveProp<Length.t>,
    borderTopWidth?: responsiveProp<Length.t>,
    borderBottomWidth?: responsiveProp<Length.t>,
    bgColor?: responsiveProp<Config.colors>,
    bgSize?: responsiveProp<BackgroundSize.t>,
    bgPosition?: responsiveProp<BackgroundPosition.t>,
    bgImage?: responsiveProp<BackgroundImage.t>,
    color?: responsiveProp<Config.colors>,
    display?: responsiveProp<Display.t>,
    justifyContent?: responsiveProp<JustifyContent.t>,
    flexDirection?: responsiveProp<FlexDirection.t>,
    alignItems?: responsiveProp<AlignItems.t>,
    flexBasis?: responsiveProp<FlexBasis.t>,
    flexWrap?: responsiveProp<FlexWrap.t>,
    flexGrow?: responsiveProp<FlexGrow.t>,
    alignContent?: responsiveProp<AlignContent.t>,
    alignSelf?: responsiveProp<AlignSelf.t>,
    justifySelf?: responsiveProp<JustifySelf.t>,
    flexFlow?: responsiveProp<FlexFlow.t>,
    gap?: responsiveProp<Gap.t>,
    p?: responsiveProp<Config.spacing>,
    px?: responsiveProp<Config.spacing>,
    py?: responsiveProp<Config.spacing>,
    pt?: responsiveProp<Config.spacing>,
    pb?: responsiveProp<Config.spacing>,
    pl?: responsiveProp<Config.spacing>,
    pr?: responsiveProp<Config.spacing>,
    m?: responsiveProp<Config.spacing>,
    mx?: responsiveProp<Config.spacing>,
    my?: responsiveProp<Config.spacing>,
    mt?: responsiveProp<Config.spacing>,
    mb?: responsiveProp<Config.spacing>,
    ml?: responsiveProp<Config.spacing>,
    mr?: responsiveProp<Config.spacing>,
    textAlign?: responsiveProp<TextAlign.t>,
    fontFamily?: responsiveProp<FontFamily.t>,
    fontWeight?: responsiveProp<FontWeight.t>,
    fontSize?: responsiveProp<Length.t>,
    letterSpacing?: responsiveProp<Length.t>,
    lineHeight?: responsiveProp<Length.t>,
    width?: responsiveProp<Length.t>,
    height?: responsiveProp<Length.t>,
    minW?: responsiveProp<Length.t>,
    minH?: responsiveProp<Length.t>,
    maxW?: responsiveProp<Length.t>,
    maxH?: responsiveProp<Length.t>,
    position?: responsiveProp<Position.t>,
    top?: responsiveProp<Length.t>,
    bottom?: responsiveProp<Length.t>,
    left?: responsiveProp<Length.t>,
    right?: responsiveProp<Length.t>,
    zIndex?: responsiveProp<Config.zIndex>,
    boxSizing?: responsiveProp<BoxSizing.t>,
    overflow?: responsiveProp<Overflow.t>,
    overflowX?: responsiveProp<Overflow.t>,
    overflowY?: responsiveProp<Overflow.t>,
    cursor?: responsiveProp<Cursor.t>,
    visibility?: responsiveProp<Visibility.t>,
    listStyleType?: responsiveProp<ListStyleType.t>,
    listStylePosition?: responsiveProp<ListStylePosition.t>,
    listStyleImage?: responsiveProp<ListStyleImage.t>,
    listStyle?: responsiveProp<ListStyle.t>,
    outlineStyle?: responsiveProp<OutlineStyle.t>,
    outline?: responsiveProp<Outline.t>,
    textDecorationStyle?: responsiveProp<TextDecorationStyle.t>,
    textDecorationLine?: responsiveProp<TextDecorationLine.t>,
    textDecoration?: responsiveProp<TextDecoration.t>,
    transform?: responsiveProp<Transform.t>,
  }

  let createResponsiveStyles = (
    {
      ?borderRadius,
      ?borderTLRadius,
      ?borderTRRadius,
      ?borderBLRadius,
      ?borderBRRadius,
      ?borderStyle,
      ?borderColor,
      ?borderWidth,
      ?border,
      ?borderRight,
      ?borderLeft,
      ?borderTop,
      ?borderBottom,
      ?borderRightStyle,
      ?borderLeftStyle,
      ?borderTopStyle,
      ?borderBottomStyle,
      ?borderRightColor,
      ?borderLeftColor,
      ?borderTopColor,
      ?borderBottomColor,
      ?borderRightWidth,
      ?borderLeftWidth,
      ?borderTopWidth,
      ?borderBottomWidth,
      ?bgColor,
      ?bgSize,
      ?bgPosition,
      ?bgImage,
      ?color,
      ?display,
      ?justifyContent,
      ?flexDirection,
      ?alignItems,
      ?flexBasis,
      ?flexWrap,
      ?flexGrow,
      ?alignContent,
      ?alignSelf,
      ?justifySelf,
      ?flexFlow,
      ?gap,
      ?p,
      ?px,
      ?py,
      ?pt,
      ?pb,
      ?pl,
      ?pr,
      ?m,
      ?mx,
      ?my,
      ?mt,
      ?mb,
      ?ml,
      ?mr,
      ?textAlign,
      ?fontFamily,
      ?fontWeight,
      ?fontSize,
      ?letterSpacing,
      ?lineHeight,
      ?width,
      ?height,
      ?minW,
      ?minH,
      ?maxW,
      ?maxH,
      ?position,
      ?top,
      ?bottom,
      ?left,
      ?right,
      ?zIndex,
      ?boxSizing,
      ?overflow,
      ?overflowX,
      ?overflowY,
      ?cursor,
      ?visibility,
      ?listStyleType,
      ?listStylePosition,
      ?listStyleImage,
      ?listStyle,
      ?outlineStyle,
      ?outline,
      ?textDecorationStyle,
      ?textDecorationLine,
      ?textDecoration,
      ?transform,
    }: responsiveStyles,
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
