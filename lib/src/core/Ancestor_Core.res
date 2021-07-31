open Ancestor_CoreTypes

/**
 * Devices
 */
type device = [#xxs | #xs | #sm | #md | #lg | #xl]

let sizeOfDevice = (value: device) =>
  switch value {
  | #xxs => "0px"
  | #xs => "375px"
  | #sm => "600px"
  | #md => "960px"
  | #lg => "1280px"
  | #xl => "1920px"
  }

let greaterThan = (current, device: device, styles) =>
  `
  ${current}
  @media (min-width: ${device->sizeOfDevice}) {
    ${styles}
  }
  `

let lessThan = (current, device: device, styles) =>
  `
  ${current}
  @media (max-width: ${device->sizeOfDevice}) {
    ${styles}
  }
  `

/*
 * Polyvariants alias, e.g:
 * <Box p=[xxs(6)] /> is equivalent to <Box p=[#xxs(6)] />
 */
let all = v => [#xxs(v)]
let xxs = v => #xxs(v)
let xs = v => #xs(v)
let sm = v => #sm(v)
let md = v => #md(v)
let lg = v => #lg(v)
let xl = v => #xl(v)

let valueByDevice = (record, device: device) =>
  switch device {
  | #xxs => record.xxs
  | #xs => record.xs
  | #sm => record.sm
  | #md => record.md
  | #lg => record.lg
  | #xl => record.xl
  }

let createStyles = (values: array<(string, record)>, device: device) => {
  values->Belt.Array.reduce("", (styles, (key, record)) =>
    record
    ->valueByDevice(device)
    ->Belt.Option.map(value =>
      `
      ${styles}
      ${key}: ${value};
      `
    )
    ->Belt.Option.getWithDefault(styles)
  )
}

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
) => {
  let values = [
    ("display", display->stringify),
    ("justify-content", justifyContent->stringify),
    ("align-items", alignItems->stringify),
    ("align-self", alignSelf->stringifyAlignSelf),
    ("flex-direction", flexDirection->stringify),
    ("flex-grow", flexGrow->stringifyGrow),
    ("flex-shrink", flexShrink->stringifyShrink),
    ("order", order->stringifyOrder),
    // Padding
    ("padding", p->stringifySpacing),
    ("padding-left", px->stringifySpacing),
    ("padding-right", px->stringifySpacing),
    ("padding-top", py->stringifySpacing),
    ("padding-bottom", py->stringifySpacing),
    ("padding-top", pt->stringifySpacing),
    ("padding-bottom", pb->stringifySpacing),
    ("padding-left", pl->stringifySpacing),
    ("padding-right", pr->stringifySpacing),
    //Margin
    ("margin", m->stringifySpacing),
    ("margin-left", mx->stringifySpacing),
    ("margin-right", mx->stringifySpacing),
    ("margin-top", my->stringifySpacing),
    ("margin-bottom", my->stringifySpacing),
    ("margin-top", mt->stringifySpacing),
    ("margin-bottom", mb->stringifySpacing),
    ("margin-left", ml->stringifySpacing),
    ("margin-right", mr->stringifySpacing),
    //Texts
    ("text-align", textAlign->stringify),
    ("letter-spacing", letterSpacing->stringifySize),
    ("line-height", lineHeight->stringifySize),
    // Sizing
    ("width", width->stringifySize),
    ("height", height->stringifySize),
    ("min-width", minW->stringifySize),
    ("min-height", minH->stringifySize),
    ("max-width", maxW->stringifySize),
    ("max-height", maxH->stringifySize),
    // Position
    ("position", position->stringify),
    // Placement
    ("top", top->stringifySize),
    ("bottom", bottom->stringifySize),
    ("left", left->stringifySize),
    ("right", right->stringifySize),
    ("z-index", zIndex->stringify),
    // Box sizing
    ("box-sizing", boxSizing->stringify),
  ]

  let xxsStyles = createStyles(values, #xxs)
  let xsStyles = createStyles(values, #xs)
  let smStyles = createStyles(values, #sm)
  let mdStyles = createStyles(values, #md)
  let lgStyles = createStyles(values, #lg)
  let xlStyles = createStyles(values, #xl)

  ""
  ->greaterThan(#xxs, xxsStyles)
  ->greaterThan(#xs, xsStyles)
  ->greaterThan(#sm, smStyles)
  ->greaterThan(#md, mdStyles)
  ->greaterThan(#lg, lgStyles)
  ->greaterThan(#xl, xlStyles)
}
