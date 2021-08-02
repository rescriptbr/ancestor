module type AncestorTypesConfig = {
  type breakpoints<'value>

  let spacing: float

  let unboxBreakpointValue: breakpoints<'value> => 'value
}

module Make = (Config: AncestorTypesConfig) => {
  type values<'a> = array<Config.breakpoints<'a>>

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

  /*
   * Stringify
   */

  external magic: 'value => string = "%identity"

  let stringify = magic

  let stringifySpacing = value =>
    `${(Js.Int.toFloat(value) *. (Config.spacing /. 10.0))
        ->Js.Float.toFixedWithPrecision(~digits=1)}rem`

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
}
