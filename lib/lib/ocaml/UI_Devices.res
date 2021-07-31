type t = [#xxs | #xs | #sm | #md | #lg | #xl]

type device = {
  xxs: bool,
  xs: bool,
  sm: bool,
  md: bool,
  lg: bool,
  xl: bool,
}

let valueOfDevice = value =>
  switch value {
  | #xxs => "0px"
  | #xs => "470px"
  | #sm => "600px"
  | #md => "960px"
  | #lg => "1280px"
  | #xl => "1920px"
  }

let greaterThan = (current, device, styles) =>
  `
  ${current}
  @media (min-width: ${device->valueOfDevice}) {
    ${styles}
  }
  `

let lessThan = (current, device, styles) =>
  `
  ${current}
  @media (max-width: ${device->valueOfDevice}) {
    ${styles}
  }
  `

let xxs = lessThan(_, #xs)
let xs = lessThan(_, #sm)
let sm = lessThan(_, #md)
let md = lessThan(_, #lg)
let lg = lessThan(_, #xl)
let xl = greaterThan(_, #xl)
