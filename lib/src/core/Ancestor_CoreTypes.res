/**
 * Core types
 */
type breakpoints<'a> = [
  | #xxs('a)
  | #xs('a)
  | #sm('a)
  | #md('a)
  | #lg('a)
  | #xl('a)
]

type record = {
  xxs: option<string>,
  xs: option<string>,
  sm: option<string>,
  md: option<string>,
  lg: option<string>,
  xl: option<string>,
}

type values<'a> = array<breakpoints<'a>>

let emptyBreakpointsRecord = {
  xxs: None,
  xs: None,
  sm: None,
  md: None,
  lg: None,
  xl: None,
}

// Transform an array of breakpoints into a record
let parseRecord = (stringify, record, value) =>
  switch value {
  | #xxs(xxs) => {...record, xxs: Some(xxs->stringify)}
  | #xs(xs) => {...record, xs: Some(xs->stringify)}
  | #sm(sm) => {...record, sm: Some(sm->stringify)}
  | #md(md) => {...record, md: Some(md->stringify)}
  | #lg(lg) => {...record, lg: Some(lg->stringify)}
  | #xl(xl) => {...record, xl: Some(xl->stringify)}
  }

let toRecord = (values, stringify) =>
  switch values {
  | Some(values) => values->Belt.Array.reduce(emptyBreakpointsRecord, parseRecord(stringify))
  | None => emptyBreakpointsRecord
  }

external magic: 'value => string = "%identity"

let stringify = values => values->toRecord(magic)

/**
 * Component props
 */
type columnSize = [
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

/**
 * CSS Properties
 */

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

let stringifyAlignSelf = values =>
  values->toRecord(value =>
    switch value {
    | #one(value) => magic(value)
    | #two(value, value2) => `${magic(value)} ${magic(value2)}`
    }
  )

let stringifyFlexValue = values =>
  values->toRecord(value =>
    switch value {
    | #number(value) => value->Js.Float.toString
    | value => magic(value)
    }
  )

let stringifyGrow = stringifyFlexValue
let stringifyShrink = stringifyFlexValue
let stringifyOrder = stringifyFlexValue

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

// Spacing
type spacing = values<int>

let stringifySpacing = values => values->toRecord(v => `${(v * 8)->Js.Int.toString}}rem`)

// Sizing
type size = values<
  [
    | #pct(float)
    | #px(float)
    | #rem(float)
    | #em(float)
  ],
>

let stringifySize = values =>
  values->toRecord(size =>
    switch size {
    | #pct(value) => `${value->Js.Float.toString}%`
    | #px(value) => `${value->Js.Float.toString}px`
    | #rem(value) => `${value->Js.Float.toString}rem`
    | #em(value) => `${value->Js.Float.toString}rem`
    }
  )

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
