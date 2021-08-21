module type Maker = {
  type breakpoints<'value>

  let spacing: float

  let unboxBreakpointValue: breakpoints<'value> => 'value

  let sizeByBreakpoints: breakpoints<'value> => int

  let css: string => string
}

module Make = (Maker: Maker) => {
  module CssTypes = Ancestor_CssTypes

  module Spacing = {
    type t = int

    let toString = value =>
      `${(Js.Int.toFloat(value) *. (Maker.spacing /. 10.0))
          ->Js.Float.toFixedWithPrecision(~digits=1)}rem`
  }

  type responsiveProp<'a> = array<Maker.breakpoints<'a>>

  type columnSizeValue = [
    | #auto
    | #1
    | #2
    | #3
    | #4
    | #5
    | #6
    | #7
    | #8
    | #9
    | #10
    | #11
    | #12
  ]

  let columnToFloat = (value: columnSizeValue) =>
    switch value {
    | #1 => 1.0
    | #2 => 2.0
    | #3 => 3.0
    | #4 => 4.0
    | #5 => 5.0
    | #6 => 6.0
    | #7 => 7.0
    | #8 => 8.0
    | #9 => 9.0
    | #10 => 10.0
    | #11 => 11.0
    | #12 => 12.0
    | _ => 12.0
    }

  type columnSize = responsiveProp<columnSizeValue>

  let basisFromFloat = (value: columnSizeValue) =>
    value->columnToFloat->(v => v *. 100.0 /. 12.0)->Js.Float.toFixedWithPrecision(~digits=1) ++ "%"

  let createBreakpointSize = device => `${device->Maker.sizeByBreakpoints->Belt.Int.toString}px`

  let mediaQuery = (current, device: Maker.breakpoints<'a>, styles) =>
    `
    ${current}
    @media (min-width: ${device->createBreakpointSize}) {
      ${styles}
    }
  `

  let sortBySize = (first, second) =>
    Maker.sizeByBreakpoints(first) - Maker.sizeByBreakpoints(second)

  let mergeStyles = (cssKey, stringify, styles, breakpointValue) =>
    mediaQuery(
      styles,
      breakpointValue,
      `${cssKey}: ${breakpointValue->Maker.unboxBreakpointValue->stringify};`,
    )

  let createCssValueFromArray = (cssKey, maybeCssValues, stringify) =>
    maybeCssValues
    ->Belt.Option.map(values =>
      values
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Belt.Array.reduce("", mergeStyles(cssKey, stringify))
    )
    ->Belt.Option.getWithDefault("")

  let createResponsiveStyles = (
    ~display: option<responsiveProp<CssTypes.Display.t>>=?,
    ~justifyContent: option<responsiveProp<CssTypes.JustifyContent.t>>=?,
    ~flexDirection: option<responsiveProp<CssTypes.FlexDirection.t>>=?,
    ~alignItems: option<responsiveProp<CssTypes.AlignItems.t>>=?,
    ~flexBasis: option<responsiveProp<CssTypes.FlexBasis.t>>=?,
    ~flexWrap: option<responsiveProp<CssTypes.FlexWrap.t>>=?,
    ~p: option<responsiveProp<Spacing.t>>=?,
    ~px: option<responsiveProp<Spacing.t>>=?,
    ~py: option<responsiveProp<Spacing.t>>=?,
    ~pt: option<responsiveProp<Spacing.t>>=?,
    ~pb: option<responsiveProp<Spacing.t>>=?,
    ~pl: option<responsiveProp<Spacing.t>>=?,
    ~pr: option<responsiveProp<Spacing.t>>=?,
    ~m: option<responsiveProp<Spacing.t>>=?,
    ~mx: option<responsiveProp<Spacing.t>>=?,
    ~my: option<responsiveProp<Spacing.t>>=?,
    ~mt: option<responsiveProp<Spacing.t>>=?,
    ~mb: option<responsiveProp<Spacing.t>>=?,
    ~ml: option<responsiveProp<Spacing.t>>=?,
    ~mr: option<responsiveProp<Spacing.t>>=?,
    ~textAlign: option<responsiveProp<CssTypes.TextAlign.t>>=?,
    ~fontWeight: option<responsiveProp<CssTypes.FontWeight.t>>=?,
    ~fontSize: option<responsiveProp<CssTypes.Length.t>>=?,
    ~letterSpacing: option<responsiveProp<CssTypes.Length.t>>=?,
    ~lineHeight: option<responsiveProp<CssTypes.Length.t>>=?,
    ~width: option<responsiveProp<CssTypes.Length.t>>=?,
    ~height: option<responsiveProp<CssTypes.Length.t>>=?,
    ~minW: option<responsiveProp<CssTypes.Length.t>>=?,
    ~minH: option<responsiveProp<CssTypes.Length.t>>=?,
    ~maxW: option<responsiveProp<CssTypes.Length.t>>=?,
    ~maxH: option<responsiveProp<CssTypes.Length.t>>=?,
    ~position: option<responsiveProp<CssTypes.Position.t>>=?,
    ~top: option<responsiveProp<CssTypes.Length.t>>=?,
    ~bottom: option<responsiveProp<CssTypes.Length.t>>=?,
    ~left: option<responsiveProp<CssTypes.Length.t>>=?,
    ~right: option<responsiveProp<CssTypes.Length.t>>=?,
    ~zIndex: option<responsiveProp<CssTypes.ZIndex.t>>=?,
    ~boxSizing: option<responsiveProp<CssTypes.BoxSizing.t>>=?,
    (),
  ) => {
    open CssTypes
    [
      createCssValueFromArray("display", display, Display.toString),
      createCssValueFromArray("justify-content", justifyContent, JustifyContent.toString),
      createCssValueFromArray("align-items", alignItems, AlignItems.toString),
      createCssValueFromArray("flex-direction", flexDirection, FlexDirection.toString),
      createCssValueFromArray("flex-basis", flexBasis, FlexBasis.toString),
      createCssValueFromArray("flex-wrap", flexWrap, FlexWrap.toString),
      createCssValueFromArray("padding", p, Spacing.toString),
      createCssValueFromArray("padding-left", px, Spacing.toString),
      createCssValueFromArray("padding-right", px, Spacing.toString),
      createCssValueFromArray("padding-top", py, Spacing.toString),
      createCssValueFromArray("padding-bottom", py, Spacing.toString),
      createCssValueFromArray("padding-top", pt, Spacing.toString),
      createCssValueFromArray("padding-bottom", pb, Spacing.toString),
      createCssValueFromArray("padding-left", pl, Spacing.toString),
      createCssValueFromArray("padding-right", pr, Spacing.toString),
      createCssValueFromArray("margin", m, Spacing.toString),
      createCssValueFromArray("margin-left", mx, Spacing.toString),
      createCssValueFromArray("margin-right", mx, Spacing.toString),
      createCssValueFromArray("margin-top", my, Spacing.toString),
      createCssValueFromArray("margin-bottom", my, Spacing.toString),
      createCssValueFromArray("margin-top", mt, Spacing.toString),
      createCssValueFromArray("margin-bottom", mb, Spacing.toString),
      createCssValueFromArray("margin-left", ml, Spacing.toString),
      createCssValueFromArray("margin-right", mr, Spacing.toString),
      createCssValueFromArray("text-align", textAlign, TextAlign.toString),
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
      createCssValueFromArray("z-index", zIndex, ZIndex.toString),
      createCssValueFromArray("box-sizing", boxSizing, BoxSizing.toString),
    ]->Js.Array2.joinWith("")
  }
}
