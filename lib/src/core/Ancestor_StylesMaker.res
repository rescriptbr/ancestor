module type T = {
  type breakpoints<'value>

  let spacing: float
  let radius: float
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let sizeByBreakpoints: breakpoints<'value> => int
  let css: string => string
}
