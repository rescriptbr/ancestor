module type Maker = {
  type breakpoints<'value>

  let spacing: float

  let unboxBreakpointValue: breakpoints<'value> => 'value
  let sizeByBreakpoints: breakpoints<'value> => int
  let css: string => string
}

module Make = (Maker: Maker) => {
  /*
   * Types
   */
  type values<'a> = array<Maker.breakpoints<'a>>

  /*
   * Base component props
   */

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

  type columnSize = values<columnSizeValue>

  let basisFromFloat = (value: columnSizeValue) =>
    value->columnToFloat->(v => v *. 100.0 /. 12.0)->Js.Float.toFixedWithPrecision(~digits=1) ++ "%"

  /**
   * CSS Properties
   */

  // Spacing
  type spacing = values<int>

  // Sizing
  type size = values<
    [
      | #pct(float)
      | #px(float)
      | #rem(float)
      | #em(float)
    ],
  >

  // Flex
  type justifyContent = values<
    [
      | #initial
      | #"space-between"
      | #center
      | #"flex-start"
      | #"flex-end"
      | #"space-around"
      | #"space-evenly"
      | #start
      | #end
      | #left
      | #right
      | #revert
      | #unset
    ],
  >

  type alignItems = values<
    [
      | #initial
      | #center
      | #start
      | #end
      | #"flex-start"
      | #"flex-end"
      | #"self-start"
      | #"self-end"
    ],
  >

  type flexDirection = values<
    [
      | #row
      | #"row-reverse"
      | #column
      | #"column-reverse"
      | #inherit
      | #initial
      | #unset
    ],
  >

  type flexValue = values<
    [
      | #inherit
      | #initial
      | #revert
      | #unset
      | #number(float)
    ],
  >

  type alignSelfValue = [
    | #auto
    | #normal
    | #center
    | #start
    | #end
    | #"self-start"
    | #"self-end"
    | #"flex-start"
    | #"flex-end"
    | #baseline
    | #first
    | #last
    | #stretch
    | #safe
    | #unsafe
    | #inherit
    | #initial
    | #unset
  ]

  type alignSelf = values<
    [
      | #one(alignSelfValue)
      | #two(alignSelfValue, alignSelfValue)
    ],
  >

  type flexGrow = flexValue
  type flexShrink = flexValue
  type order = flexValue

  type flexWrap = values<
    [
      | #nowrap
      | #wrap
      | #"wrap-reverse"
      | #inherit
      | #initial
      | #unset
    ],
  >

  // Texts
  type textAlign = values<[#center | #left | #right]>

  // General
  type display = values<[#none | #block | #flex]>

  // Postion
  type position = values<
    [
      | #static
      | #relative
      | #absolute
      | #fixed
      | #sticky
    ],
  >

  // Box sizing
  type boxSizing = values<
    [
      | #"content-box"
      | #"border-box"
      | #initial
      | #inherit
    ],
  >

  let calculateSpacing = value =>
    `${(Js.Int.toFloat(value) *. (Maker.spacing /. 10.0))
        ->Js.Float.toFixedWithPrecision(~digits=1)}rem`

  /*
   * Stringify
   */
  external magic: 'value => string = "%identity"

  let stringify = magic

  let stringifySpacing = calculateSpacing

  let stringifySize = size =>
    switch size {
    | #pct(value) => `${value->Js.Float.toString}%`
    | #px(value) => `${value->Js.Float.toString}px`
    | #rem(value) => `${value->Js.Float.toString}rem`
    | #em(value) => `${value->Js.Float.toString}rem`
    }

  let stringifyAlignSelf = value =>
    switch value {
    | #one(value) => magic(value)
    | #two(value, value2) => `${magic(value)} ${magic(value2)}`
    }

  let stringifyFlexValue = value =>
    switch value {
    | #number(value) => value->Js.Float.toString
    | value => magic(value)
    }

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

  let createStyles = (cssKey, maybeCssValues, stringify) =>
    maybeCssValues
    ->Belt.Option.map(values =>
      values
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Belt.Array.reduce("", mergeStyles(cssKey, stringify))
    )
    ->Belt.Option.getWithDefault("")

  let createResponsiveStyles = (
    // Flex
    ~display: option<display>=?,
    ~justifyContent: option<justifyContent>=?,
    ~flexDirection: option<flexDirection>=?,
    ~alignItems: option<alignItems>=?,
    ~flexGrow: option<flexGrow>=?,
    ~flexShrink: option<flexShrink>=?,
    ~order: option<order>=?,
    ~alignSelf: option<alignSelf>=?,
    ~flexBasis: option<size>=?,
    // Padding
    ~p: option<spacing>=?,
    ~px: option<spacing>=?,
    ~py: option<spacing>=?,
    ~pt: option<spacing>=?,
    ~pb: option<spacing>=?,
    ~pl: option<spacing>=?,
    ~pr: option<spacing>=?,
    // Margin
    ~m: option<spacing>=?,
    ~mx: option<spacing>=?,
    ~my: option<spacing>=?,
    ~mt: option<spacing>=?,
    ~mb: option<spacing>=?,
    ~ml: option<spacing>=?,
    ~mr: option<spacing>=?,
    // Texts
    ~textAlign: option<textAlign>=?,
    ~letterSpacing: option<size>=?,
    ~lineHeight: option<size>=?,
    // Sizing
    ~width: option<size>=?,
    ~height: option<size>=?,
    ~minW: option<size>=?,
    ~minH: option<size>=?,
    ~maxW: option<size>=?,
    ~maxH: option<size>=?,
    // Placement
    ~position: option<position>=?,
    ~top: option<size>=?,
    ~bottom: option<size>=?,
    ~left: option<size>=?,
    ~right: option<size>=?,
    ~zIndex: option<size>=?,
    // Box sizing
    ~boxSizing: option<boxSizing>=?,
    (),
  ) =>
    [
      // Flex
      createStyles("display", display, stringify),
      createStyles("justify-content", justifyContent, stringify),
      createStyles("align-items", alignItems, stringify),
      createStyles("flex-direction", flexDirection, stringify),
      createStyles("flex-grow", flexGrow, stringifyFlexValue),
      createStyles("flex-shrink", flexShrink, stringifyFlexValue),
      createStyles("align-self", alignSelf, stringifyAlignSelf),
      createStyles("order", order, stringifyFlexValue),
      createStyles("flex-basis", flexBasis, stringifySize),
      // Padding
      createStyles("padding", p, stringifySpacing),
      createStyles("padding-left", px, stringifySpacing),
      createStyles("padding-right", px, stringifySpacing),
      createStyles("padding-top", py, stringifySpacing),
      createStyles("padding-bottom", py, stringifySpacing),
      createStyles("padding-top", pt, stringifySpacing),
      createStyles("padding-bottom", pb, stringifySpacing),
      createStyles("padding-left", pl, stringifySpacing),
      createStyles("padding-right", pr, stringifySpacing),
      // Margin
      createStyles("margin", m, stringifySpacing),
      createStyles("margin-left", mx, stringifySpacing),
      createStyles("margin-right", mx, stringifySpacing),
      createStyles("margin-top", my, stringifySpacing),
      createStyles("margin-bottom", my, stringifySpacing),
      createStyles("margin-top", mt, stringifySpacing),
      createStyles("margin-bottom", mb, stringifySpacing),
      createStyles("margin-left", ml, stringifySpacing),
      createStyles("margin-right", mr, stringifySpacing),
      // Texts
      createStyles("text-align", textAlign, stringify),
      createStyles("letter-spacing", letterSpacing, stringifySize),
      createStyles("line-height", lineHeight, stringifySize),
      // Sizing
      createStyles("width", width, stringifySize),
      createStyles("height", height, stringifySize),
      createStyles("min-width", minW, stringifySize),
      createStyles("min-height", minH, stringifySize),
      createStyles("max-width", maxW, stringifySize),
      createStyles("max-height", maxH, stringifySize),
      // Position
      createStyles("position", position, stringify),
      // Placement
      createStyles("top", top, stringifySize),
      createStyles("bottom", bottom, stringifySize),
      createStyles("left", left, stringifySize),
      createStyles("right", right, stringifySize),
      createStyles("z-index", zIndex, stringify),
      // Box sizing
      createStyles("box-sizing", boxSizing, stringify),
    ]->Js.Array2.joinWith("")
}
