include UI_TypedProps

module Option = Belt.Option

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

let valueByDevice = (record, device) =>
  switch device {
  | #xxs => record.xxs
  | #xs => record.xs
  | #sm => record.sm
  | #md => record.md
  | #lg => record.lg
  | #xl => record.xl
  }

let createStyles = (values: array<(string, record)>, device: UI_Devices.t) => {
  values->Belt.Array.reduce("", (styles, (key, record)) =>
    record
    ->valueByDevice(device)
    ->Option.map(value =>
      `
      ${styles}
      ${key}: ${value};
      `
    )
    ->Option.getWithDefault(styles)
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
  ->UI_Devices.greaterThan(#xxs, xxsStyles)
  ->UI_Devices.greaterThan(#xs, xsStyles)
  ->UI_Devices.greaterThan(#sm, smStyles)
  ->UI_Devices.greaterThan(#md, mdStyles)
  ->UI_Devices.greaterThan(#lg, lgStyles)
  ->UI_Devices.greaterThan(#xl, xlStyles)
}
