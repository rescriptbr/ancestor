module AncestorCustom = Ancestor.Make({
  open Ancestor.DefaultConfig

  type breakpoints<'value> = breakpoints<'value>
  let unboxBreakpointValue = unboxBreakpointValue
  let sizeByBreakpoints = sizeByBreakpoints
  let css = css

  type spacing = spacing
  let spacing = spacing

  //highlight-start
  type zIndex = [
    | #base
    | #above
    | #aboveAll
  ]

  let zIndex = token =>
    switch token {
    | #base => 5
    | #above => 15
    | #aboveAll => 20
    }
  //highlight-end

  type colors = colors
  let colors = colors

  type radius = radius
  let radius = radius
})

@react.component
let make = () => {
  open AncestorCustom

  // highlight-start
  <Box position=[#xs(#relative)]>
    <Box zIndex=[#xs(#base)] position=[#xs(#absolute)] />
    <Box zIndex=[#xs(#above)] position=[#xs(#absolute)] />
  </Box>
  // highlight-end
}
