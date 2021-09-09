module Make = (Maker: Ancestor_StylesMaker.T) => {
  open Ancestor_CssTypes

  module Spacing = {
    type t = int

    let make = value =>
      `${(Js.Int.toFloat(value) *. (Maker.spacing /. 10.0))
          ->Js.Float.toFixedWithPrecision(~digits=1)}rem`
  }

  module Radius = {
    type t = int

    let make = value =>
      `${(Js.Int.toFloat(value) *. (Maker.radius /. 10.0))
          ->Js.Float.toFixedWithPrecision(~digits=1)}rem`
  }

  type responsiveProp<'a> = array<Maker.breakpoints<'a>>

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
    ~borderRadius: option<responsiveProp<Radius.t>>=?,
    ~border: option<responsiveProp<Border.t>>=?,
    ~borderRight: option<responsiveProp<Border.t>>=?,
    ~borderLeft: option<responsiveProp<Border.t>>=?,
    ~borderTop: option<responsiveProp<Border.t>>=?,
    ~borderBottom: option<responsiveProp<Border.t>>=?,
    ~bgColor: option<responsiveProp<Color.t>>=?,
    ~color: option<responsiveProp<Color.t>>=?,
    ~display: option<responsiveProp<Display.t>>=?,
    ~justifyContent: option<responsiveProp<JustifyContent.t>>=?,
    ~flexDirection: option<responsiveProp<FlexDirection.t>>=?,
    ~alignItems: option<responsiveProp<AlignItems.t>>=?,
    ~flexBasis: option<responsiveProp<FlexBasis.t>>=?,
    ~flexWrap: option<responsiveProp<FlexWrap.t>>=?,
    ~flexGrow: option<responsiveProp<FlexGrow.t>>=?,
    ~alignContent: option<responsiveProp<AlignContent.t>>=?,
    ~alignSelf: option<responsiveProp<AlignSelf.t>>=?,
    ~justifySelf: option<responsiveProp<JustifySelf.t>>=?,
    ~flexFlow: option<responsiveProp<FlexFlow.t>>=?,
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
    ~textAlign: option<responsiveProp<TextAlign.t>>=?,
    ~fontWeight: option<responsiveProp<FontWeight.t>>=?,
    ~fontSize: option<responsiveProp<Length.t>>=?,
    ~letterSpacing: option<responsiveProp<Length.t>>=?,
    ~lineHeight: option<responsiveProp<Length.t>>=?,
    ~width: option<responsiveProp<Length.t>>=?,
    ~height: option<responsiveProp<Length.t>>=?,
    ~minW: option<responsiveProp<Length.t>>=?,
    ~minH: option<responsiveProp<Length.t>>=?,
    ~maxW: option<responsiveProp<Length.t>>=?,
    ~maxH: option<responsiveProp<Length.t>>=?,
    ~position: option<responsiveProp<Position.t>>=?,
    ~top: option<responsiveProp<Length.t>>=?,
    ~bottom: option<responsiveProp<Length.t>>=?,
    ~left: option<responsiveProp<Length.t>>=?,
    ~right: option<responsiveProp<Length.t>>=?,
    ~zIndex: option<responsiveProp<ZIndex.t>>=?,
    ~boxSizing: option<responsiveProp<BoxSizing.t>>=?,
    ~overflow: option<responsiveProp<Overflow.t>>=?,
    ~overflowX: option<responsiveProp<Overflow.t>>=?,
    ~overflowY: option<responsiveProp<Overflow.t>>=?,
    ~cursor: option<responsiveProp<Cursor.t>>=?,
    ~visibility: option<responsiveProp<Visibility.t>>=?,
    ~listStyleType: option<responsiveProp<ListStyleType.t>>=?,
    ~outlineStyle: option<responsiveProp<OutlineStyle.t>>=?,
    (),
  ) =>
    [
      createCssValueFromArray("border-radius", borderRadius, Radius.make),
      createCssValueFromArray("border", border, Border.toString),
      createCssValueFromArray("border-right", borderRight, Border.toString),
      createCssValueFromArray("border-left", borderLeft, Border.toString),
      createCssValueFromArray("border-top", borderTop, Border.toString),
      createCssValueFromArray("border-bottom", borderBottom, Border.toString),
      createCssValueFromArray("background-color", bgColor, Color.toString),
      createCssValueFromArray("color", color, Color.toString),
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
      createCssValueFromArray("padding", p, Spacing.make),
      createCssValueFromArray("padding-left", px, Spacing.make),
      createCssValueFromArray("padding-right", px, Spacing.make),
      createCssValueFromArray("padding-top", py, Spacing.make),
      createCssValueFromArray("padding-bottom", py, Spacing.make),
      createCssValueFromArray("padding-top", pt, Spacing.make),
      createCssValueFromArray("padding-bottom", pb, Spacing.make),
      createCssValueFromArray("padding-left", pl, Spacing.make),
      createCssValueFromArray("padding-right", pr, Spacing.make),
      createCssValueFromArray("margin", m, Spacing.make),
      createCssValueFromArray("margin-left", mx, Spacing.make),
      createCssValueFromArray("margin-right", mx, Spacing.make),
      createCssValueFromArray("margin-top", my, Spacing.make),
      createCssValueFromArray("margin-bottom", my, Spacing.make),
      createCssValueFromArray("margin-top", mt, Spacing.make),
      createCssValueFromArray("margin-bottom", mb, Spacing.make),
      createCssValueFromArray("margin-left", ml, Spacing.make),
      createCssValueFromArray("margin-right", mr, Spacing.make),
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
      createCssValueFromArray("overflow", overflow, Overflow.toString),
      createCssValueFromArray("overflow-x", overflowX, Overflow.toString),
      createCssValueFromArray("overflow-y", overflowY, Overflow.toString),
      createCssValueFromArray("cursor", cursor, Cursor.toString),
      createCssValueFromArray("visibility", visibility, Visibility.toString),
      createCssValueFromArray("list-style-type", listStyleType, ListStyleType.toString),
      createCssValueFromArray("outline-style", outlineStyle, OutlineStyle.toString),
    ]->Js.Array2.joinWith("")
}
