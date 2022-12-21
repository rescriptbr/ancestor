module Make = (Config: Ancestor_Config.T) => {
  module Css = Ancestor_Css.Make({
    type spacing = Config.spacing
    let spacing = Config.spacing

    type colors = Config.colors
    let colors = Config.colors
  })

  open Css

  type t = {
    borderRadius?: Config.breakpoints<Config.radius>,
    borderTLRadius?: Config.breakpoints<Config.radius>,
    borderTRRadius?: Config.breakpoints<Config.radius>,
    borderBLRadius?: Config.breakpoints<Config.radius>,
    borderBRRadius?: Config.breakpoints<Config.radius>,
    borderStyle?: Config.breakpoints<BorderStyle.t>,
    borderColor?: Config.breakpoints<Config.colors>,
    borderWidth?: Config.breakpoints<Length.t>,
    border?: Config.breakpoints<Border.t>,
    borderRight?: Config.breakpoints<Border.t>,
    borderLeft?: Config.breakpoints<Border.t>,
    borderTop?: Config.breakpoints<Border.t>,
    borderBottom?: Config.breakpoints<Border.t>,
    borderRightStyle?: Config.breakpoints<BorderStyle.t>,
    borderLeftStyle?: Config.breakpoints<BorderStyle.t>,
    borderTopStyle?: Config.breakpoints<BorderStyle.t>,
    borderBottomStyle?: Config.breakpoints<BorderStyle.t>,
    borderRightColor?: Config.breakpoints<Config.colors>,
    borderLeftColor?: Config.breakpoints<Config.colors>,
    borderTopColor?: Config.breakpoints<Config.colors>,
    borderBottomColor?: Config.breakpoints<Config.colors>,
    borderRightWidth?: Config.breakpoints<Length.t>,
    borderLeftWidth?: Config.breakpoints<Length.t>,
    borderTopWidth?: Config.breakpoints<Length.t>,
    borderBottomWidth?: Config.breakpoints<Length.t>,
    bgColor?: Config.breakpoints<Config.colors>,
    bgSize?: Config.breakpoints<BackgroundSize.t>,
    bgPosition?: Config.breakpoints<BackgroundPosition.t>,
    bgImage?: Config.breakpoints<BackgroundImage.t>,
    color?: Config.breakpoints<Config.colors>,
    display?: Config.breakpoints<Display.t>,
    justifyContent?: Config.breakpoints<JustifyContent.t>,
    flexDirection?: Config.breakpoints<FlexDirection.t>,
    alignItems?: Config.breakpoints<AlignItems.t>,
    flexBasis?: Config.breakpoints<FlexBasis.t>,
    flexWrap?: Config.breakpoints<FlexWrap.t>,
    flexGrow?: Config.breakpoints<FlexGrow.t>,
    alignContent?: Config.breakpoints<AlignContent.t>,
    alignSelf?: Config.breakpoints<AlignSelf.t>,
    justifySelf?: Config.breakpoints<JustifySelf.t>,
    flexFlow?: Config.breakpoints<FlexFlow.t>,
    gap?: Config.breakpoints<Gap.t>,
    p?: Config.breakpoints<Config.spacing>,
    px?: Config.breakpoints<Config.spacing>,
    py?: Config.breakpoints<Config.spacing>,
    pt?: Config.breakpoints<Config.spacing>,
    pb?: Config.breakpoints<Config.spacing>,
    pl?: Config.breakpoints<Config.spacing>,
    pr?: Config.breakpoints<Config.spacing>,
    m?: Config.breakpoints<Config.spacing>,
    mx?: Config.breakpoints<Config.spacing>,
    my?: Config.breakpoints<Config.spacing>,
    mt?: Config.breakpoints<Config.spacing>,
    mb?: Config.breakpoints<Config.spacing>,
    ml?: Config.breakpoints<Config.spacing>,
    mr?: Config.breakpoints<Config.spacing>,
    textAlign?: Config.breakpoints<TextAlign.t>,
    fontFamily?: Config.breakpoints<FontFamily.t>,
    fontWeight?: Config.breakpoints<FontWeight.t>,
    fontSize?: Config.breakpoints<Length.t>,
    letterSpacing?: Config.breakpoints<Length.t>,
    lineHeight?: Config.breakpoints<Length.t>,
    width?: Config.breakpoints<Length.t>,
    height?: Config.breakpoints<Length.t>,
    minW?: Config.breakpoints<Length.t>,
    minH?: Config.breakpoints<Length.t>,
    maxW?: Config.breakpoints<Length.t>,
    maxH?: Config.breakpoints<Length.t>,
    position?: Config.breakpoints<Position.t>,
    top?: Config.breakpoints<Length.t>,
    bottom?: Config.breakpoints<Length.t>,
    left?: Config.breakpoints<Length.t>,
    right?: Config.breakpoints<Length.t>,
    zIndex?: Config.breakpoints<Config.zIndex>,
    boxSizing?: Config.breakpoints<BoxSizing.t>,
    overflow?: Config.breakpoints<Overflow.t>,
    overflowX?: Config.breakpoints<Overflow.t>,
    overflowY?: Config.breakpoints<Overflow.t>,
    cursor?: Config.breakpoints<Cursor.t>,
    visibility?: Config.breakpoints<Visibility.t>,
    listStyleType?: Config.breakpoints<ListStyleType.t>,
    listStylePosition?: Config.breakpoints<ListStylePosition.t>,
    listStyleImage?: Config.breakpoints<ListStyleImage.t>,
    listStyle?: Config.breakpoints<ListStyle.t>,
    outlineStyle?: Config.breakpoints<OutlineStyle.t>,
    outline?: Config.breakpoints<Outline.t>,
    textDecorationStyle?: Config.breakpoints<TextDecorationStyle.t>,
    textDecorationLine?: Config.breakpoints<TextDecorationLine.t>,
    textDecoration?: Config.breakpoints<TextDecoration.t>,
    transform?: Config.breakpoints<Transform.t>,
  }

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

  let createResponsiveStyles = (styles: t) => {
    let s = createResponsiveValue
    [
      s("border-radius", styles.borderRadius, radius),
      s("border-top-left-radius", styles.borderTLRadius, radius),
      s("border-top-right-radius", styles.borderTRRadius, radius),
      s("border-bottom-left-radius", styles.borderBLRadius, radius),
      s("border-bottom-right-radius", styles.borderBRRadius, radius),
      s("border-style", styles.borderStyle, BorderStyle.toString),
      s("border-color", styles.borderColor, colors),
      s("border-width", styles.borderWidth, Length.toString),
      s("border", styles.border, Border.toString),
      s("border-right", styles.borderRight, Border.toString),
      s("border-left", styles.borderLeft, Border.toString),
      s("border-top", styles.borderTop, Border.toString),
      s("border-bottom", styles.borderBottom, Border.toString),
      s("border-right-style", styles.borderRightStyle, BorderStyle.toString),
      s("border-left-style", styles.borderLeftStyle, BorderStyle.toString),
      s("border-top-style", styles.borderTopStyle, BorderStyle.toString),
      s("border-bottom-style", styles.borderBottomStyle, BorderStyle.toString),
      s("border-right-color", styles.borderRightColor, colors),
      s("border-left-color", styles.borderLeftColor, colors),
      s("border-top-color", styles.borderTopColor, colors),
      s("border-bottom-color", styles.borderBottomColor, colors),
      s("border-right-width", styles.borderRightWidth, Length.toString),
      s("border-left-width", styles.borderLeftWidth, Length.toString),
      s("border-top-width", styles.borderTopWidth, Length.toString),
      s("border-bottom-width", styles.borderBottomWidth, Length.toString),
      s("background-color", styles.bgColor, colors),
      s("background-size", styles.bgSize, BackgroundSize.toString),
      s("background-position", styles.bgPosition, BackgroundPosition.toString),
      s("background-image", styles.bgImage, BackgroundImage.toString),
      s("color", styles.color, colors),
      s("display", styles.display, Display.toString),
      s("justify-content", styles.justifyContent, JustifyContent.toString),
      s("align-items", styles.alignItems, AlignItems.toString),
      s("flex-direction", styles.flexDirection, FlexDirection.toString),
      s("flex-basis", styles.flexBasis, FlexBasis.toString),
      s("flex-wrap", styles.flexWrap, FlexWrap.toString),
      s("flex-grow", styles.flexGrow, FlexGrow.toString),
      s("align-content", styles.alignContent, AlignContent.toString),
      s("align-self", styles.alignSelf, AlignSelf.toString),
      s("justify-self", styles.justifySelf, JustifySelf.toString),
      s("flex-flow", styles.flexFlow, FlexFlow.toString),
      s("gap", styles.gap, Gap.toString),
      s("padding", styles.p, spacing),
      s("padding-left", styles.px, spacing),
      s("padding-right", styles.px, spacing),
      s("padding-top", styles.py, spacing),
      s("padding-bottom", styles.py, spacing),
      s("padding-top", styles.pt, spacing),
      s("padding-bottom", styles.pb, spacing),
      s("padding-left", styles.pl, spacing),
      s("padding-right", styles.pr, spacing),
      s("margin", styles.m, spacing),
      s("margin-left", styles.mx, spacing),
      s("margin-right", styles.mx, spacing),
      s("margin-top", styles.my, spacing),
      s("margin-bottom", styles.my, spacing),
      s("margin-top", styles.mt, spacing),
      s("margin-bottom", styles.mb, spacing),
      s("margin-left", styles.ml, spacing),
      s("margin-right", styles.mr, spacing),
      s("text-align", styles.textAlign, TextAlign.toString),
      s("font-family", styles.fontFamily, FontFamily.toString),
      s("font-weight", styles.fontWeight, FontWeight.toString),
      s("font-size", styles.fontSize, Length.toString),
      s("letter-spacing", styles.letterSpacing, Length.toString),
      s("line-height", styles.lineHeight, Length.toString),
      s("width", styles.width, Length.toString),
      s("height", styles.height, Length.toString),
      s("min-width", styles.minW, Length.toString),
      s("min-height", styles.minH, Length.toString),
      s("max-width", styles.maxW, Length.toString),
      s("max-height", styles.maxH, Length.toString),
      s("position", styles.position, Position.toString),
      s("top", styles.top, Length.toString),
      s("bottom", styles.bottom, Length.toString),
      s("left", styles.left, Length.toString),
      s("right", styles.right, Length.toString),
      s("z-index", styles.zIndex, v => v->Config.zIndex->ZIndex.toString),
      s("box-sizing", styles.boxSizing, BoxSizing.toString),
      s("overflow", styles.overflow, Overflow.toString),
      s("overflow-x", styles.overflowX, Overflow.toString),
      s("overflow-y", styles.overflowY, Overflow.toString),
      s("cursor", styles.cursor, Cursor.toString),
      s("visibility", styles.visibility, Visibility.toString),
      s("list-style-type", styles.listStyleType, ListStyleType.toString),
      s("list-style-position", styles.listStylePosition, ListStylePosition.toString),
      s("list-style-image", styles.listStyleImage, ListStyleImage.toString),
      s("list-style", styles.listStyle, ListStyle.toString),
      s("outline-style", styles.outlineStyle, OutlineStyle.toString),
      s("outline", styles.outline, Outline.toString),
      s("text-decoration-style", styles.textDecorationStyle, TextDecorationStyle.toString),
      s("text-decoration-line", styles.textDecorationLine, TextDecorationLine.toString),
      s("text-decoration", styles.textDecoration, TextDecoration.toString),
      s("transform", styles.transform, Transform.toString),
    ]->Js.Array2.joinWith("")
  }

  let createPseudoStyle = (pseudoKey, maybeStyles) =>
    maybeStyles
    ->Belt.Option.map(styles =>
      `${pseudoKey} {
      ${styles->createResponsiveStyles}
    }`
    )
    ->Belt.Option.getWithDefault("")

  let createPseudoStyles = (~_hover=?, ~_focus=?, ()) => {
    let s = createPseudoStyle
    [s("&:hover", _hover), s("&:focus", _focus)]->Js.Array2.joinWith("\n")
  }

  let merge = styles => styles->Js.Array2.joinWith("")
}
