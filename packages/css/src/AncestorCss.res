module Make = (
  Spacing: AncestorCss_Config.Spacing,
  Radius: AncestorCss_Config.Radius,
  Colors: AncestorCss_Config.Colors,
  ZIndex: AncestorCss_Config.ZIndex,
  Parser: AncestorCss_Parsers.Config,
) => {
  module TokensConfig = {
    include Spacing
    include Radius
    include Colors
    include ZIndex
  }
  module Types = AncestorCss_Types.Make(TokensConfig)
  module Context = AncestorCss_Context.Make(Parser, TokensConfig)
  module Provider = Context.Provider

  open! Types

  type rec t = {
    borderRadius?: Parser.t<TokensConfig.radius>,
    borderTLRadius?: Parser.t<TokensConfig.radius>,
    borderTRRadius?: Parser.t<TokensConfig.radius>,
    borderBLRadius?: Parser.t<TokensConfig.radius>,
    borderBRRadius?: Parser.t<TokensConfig.radius>,
    borderStyle?: Parser.t<BorderStyle.t>,
    borderColor?: Parser.t<TokensConfig.colors>,
    borderWidth?: Parser.t<Length.t>,
    border?: Parser.t<Border.t>,
    borderRight?: Parser.t<Border.t>,
    borderLeft?: Parser.t<Border.t>,
    borderTop?: Parser.t<Border.t>,
    borderBottom?: Parser.t<Border.t>,
    borderRightStyle?: Parser.t<BorderStyle.t>,
    borderLeftStyle?: Parser.t<BorderStyle.t>,
    borderTopStyle?: Parser.t<BorderStyle.t>,
    borderBottomStyle?: Parser.t<BorderStyle.t>,
    borderRightColor?: Parser.t<TokensConfig.colors>,
    borderLeftColor?: Parser.t<TokensConfig.colors>,
    borderTopColor?: Parser.t<TokensConfig.colors>,
    borderBottomColor?: Parser.t<TokensConfig.colors>,
    borderRightWidth?: Parser.t<Length.t>,
    borderLeftWidth?: Parser.t<Length.t>,
    borderTopWidth?: Parser.t<Length.t>,
    borderBottomWidth?: Parser.t<Length.t>,
    bgColor?: Parser.t<TokensConfig.colors>,
    bgSize?: Parser.t<BackgroundSize.t>,
    bgPosition?: Parser.t<BackgroundPosition.t>,
    bgImage?: Parser.t<BackgroundImage.t>,
    color?: Parser.t<TokensConfig.colors>,
    display?: Parser.t<Display.t>,
    justifyContent?: Parser.t<JustifyContent.t>,
    flexDirection?: Parser.t<FlexDirection.t>,
    alignItems?: Parser.t<AlignItems.t>,
    flexBasis?: Parser.t<FlexBasis.t>,
    flexWrap?: Parser.t<FlexWrap.t>,
    flexGrow?: Parser.t<FlexGrow.t>,
    alignContent?: Parser.t<AlignContent.t>,
    alignSelf?: Parser.t<AlignSelf.t>,
    justifySelf?: Parser.t<JustifySelf.t>,
    flexFlow?: Parser.t<FlexFlow.t>,
    gap?: Parser.t<Gap.t>,
    p?: Parser.t<TokensConfig.spacing>,
    px?: Parser.t<TokensConfig.spacing>,
    py?: Parser.t<TokensConfig.spacing>,
    pt?: Parser.t<TokensConfig.spacing>,
    pb?: Parser.t<TokensConfig.spacing>,
    pl?: Parser.t<TokensConfig.spacing>,
    pr?: Parser.t<TokensConfig.spacing>,
    m?: Parser.t<TokensConfig.spacing>,
    mx?: Parser.t<TokensConfig.spacing>,
    my?: Parser.t<TokensConfig.spacing>,
    mt?: Parser.t<TokensConfig.spacing>,
    mb?: Parser.t<TokensConfig.spacing>,
    ml?: Parser.t<TokensConfig.spacing>,
    mr?: Parser.t<TokensConfig.spacing>,
    textAlign?: Parser.t<TextAlign.t>,
    fontFamily?: Parser.t<FontFamily.t>,
    fontWeight?: Parser.t<FontWeight.t>,
    fontSize?: Parser.t<Length.t>,
    letterSpacing?: Parser.t<Length.t>,
    lineHeight?: Parser.t<Length.t>,
    width?: Parser.t<Length.t>,
    height?: Parser.t<Length.t>,
    minW?: Parser.t<Length.t>,
    minH?: Parser.t<Length.t>,
    maxW?: Parser.t<Length.t>,
    maxH?: Parser.t<Length.t>,
    position?: Parser.t<Position.t>,
    top?: Parser.t<Length.t>,
    bottom?: Parser.t<Length.t>,
    left?: Parser.t<Length.t>,
    right?: Parser.t<Length.t>,
    zIndex?: Parser.t<ZIndex.t>,
    boxSizing?: Parser.t<BoxSizing.t>,
    overflow?: Parser.t<Overflow.t>,
    overflowX?: Parser.t<Overflow.t>,
    overflowY?: Parser.t<Overflow.t>,
    cursor?: Parser.t<Cursor.t>,
    visibility?: Parser.t<Visibility.t>,
    listStyleType?: Parser.t<ListStyleType.t>,
    listStylePosition?: Parser.t<ListStylePosition.t>,
    listStyleImage?: Parser.t<ListStyleImage.t>,
    listStyle?: Parser.t<ListStyle.t>,
    outlineStyle?: Parser.t<OutlineStyle.t>,
    outline?: Parser.t<Outline.t>,
    textDecorationStyle?: Parser.t<TextDecorationStyle.t>,
    textDecorationLine?: Parser.t<TextDecorationLine.t>,
    textDecoration?: Parser.t<TextDecoration.t>,
    transform?: Parser.t<Transform.t>,
    /*
     * Pseudo
     */
    _hover?: t,
    _focus?: t,
    _active?: t,
    _focusWithin?: t,
    _focusVisible?: t,
    _disabled?: t,
    _before?: t,
    _after?: t,
    _even?: t,
    _odd?: t,
    _first?: t,
    _last?: t,
    _notFirst?: t,
    _notLast?: t,
    selectors?: array<(string, t)>,
  }

  let createPseudoStyle = (transformer, selector, maybeStyles) =>
    maybeStyles->Belt.Option.map(styles => `${selector} { ${styles->transformer} }`)

  let createSelectorStyle = (transformer, selectors) => {
    selectors->Belt.Option.map(s => s->Js.Array2.reduce((acc, (selector, styles)) => {
        `
        ${acc}
        ${selector} { ${styles->transformer} }
      `
      }, ""))
  }

  let rec parseToCss = (api: Context.api, styles: t) => {
    let cssTransformer = parseToCss(api)
    let s = Parser.parse
    let p = createPseudoStyle(cssTransformer)

    /*
     * Local parsers
     */
    let spacing = v => v->api.spacing->Length.toString
    let colors = v => v->api.colors->Color.toString
    let radius = v => v->api.radius->Length.toString
    let zIndex = v => v->api.zIndex->Js.Int.toString
    let borderToString = Border.toString(~colors)

    [
      s("border-radius", styles.borderRadius, radius),
      s("border-top-left-radius", styles.borderTLRadius, radius),
      s("border-top-right-radius", styles.borderTRRadius, radius),
      s("border-bottom-left-radius", styles.borderBLRadius, radius),
      s("border-bottom-right-radius", styles.borderBRRadius, radius),
      s("border-style", styles.borderStyle, BorderStyle.toString),
      s("border-color", styles.borderColor, colors),
      s("border-width", styles.borderWidth, Length.toString),
      s("border", styles.border, borderToString),
      s("border-right", styles.borderRight, borderToString),
      s("border-left", styles.borderLeft, borderToString),
      s("border-top", styles.borderTop, borderToString),
      s("border-bottom", styles.borderBottom, borderToString),
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
      s("gap", styles.gap, Gap.toString(~spacing)),
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
      s("z-index", styles.zIndex, zIndex),
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
      s("outline", styles.outline, Outline.toString(~colors)),
      s("text-decoration-style", styles.textDecorationStyle, TextDecorationStyle.toString),
      s("text-decoration-line", styles.textDecorationLine, TextDecorationLine.toString),
      s("text-decoration", styles.textDecoration, TextDecoration.toString(~colors)),
      s("transform", styles.transform, Transform.toString),
      p("&:hover", styles._hover),
      p("&:focus", styles._focus),
      p("&:active", styles._active),
      p("&:focus-within", styles._focusWithin),
      p("&:focus-visible", styles._focusVisible),
      p("&[disabled]", styles._disabled),
      p("&::before", styles._before),
      p("&::after", styles._after),
      p("&:nth-of-type(even)", styles._even),
      p("&:nth-of-type(odd)", styles._odd),
      p("&:first-of-type", styles._first),
      p("&:last-of-type", styles._last),
      p("&:not(:first-of-type)", styles._notFirst),
      p("&:not(:last-of-type)", styles._notLast),
      createSelectorStyle(cssTransformer, styles.selectors),
    ]
    ->Js.Array2.filter(Belt.Option.isSome)
    ->Js.Array2.map(Belt.Option.getWithDefault(_, ""))
    ->Js.Array2.joinWith("")
  }

  let createClass = (styles: t) =>
    parseToCss(
      {
        colors: TokensConfig.colors,
        spacing: TokensConfig.spacing,
        radius: TokensConfig.radius,
        zIndex: TokensConfig.zIndex,
      },
      styles,
    )->Emotion.rawCss

  type useCssApi = {css: t => string}

  let useCss = (): useCssApi => {
    let context = Context.useContext()
    let css = (styles: t) => parseToCss(context, styles)->Emotion.rawCss

    {css: css}
  }
}

module Defaults = {
  open AncestorCss_Types

  let identity = v => v

  module Spacing = {
    type spacing = Length.t
    let spacing = identity
  }

  module Colors = {
    type colors = Color.t
    let colors = identity
  }

  module Radius = {
    type radius = Length.t
    let radius = identity
  }

  module ZIndex = {
    type zIndex = int
    let zIndex = identity
  }
}

include Make(
  Defaults.Spacing,
  Defaults.Radius,
  Defaults.Colors,
  Defaults.ZIndex,
  AncestorCss_Parsers.Simple,
)
