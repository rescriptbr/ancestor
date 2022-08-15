module AncestorCustom = Ancestor.Make({
  open Ancestor.DefaultConfig

  type breakpoints<'value> = breakpoints<'value>
  let unboxBreakpointValue = unboxBreakpointValue
  let sizeByBreakpoints = sizeByBreakpoints
  let css = css

  type spacing = spacing
  let spacing = spacing

  type zIndex = zIndex
  let zIndex = zIndex

  //highlight-start
  type colors = [
    | #primary100
    | #secondary100
    | #background
  ]

  let colors = token =>
    switch token {
    | #primary100 => #hex("#000")
    | #secondary100 => #hex("#cecece")
    | #background => #hex("#fafafa")
    }
  //highlight-end

  type radius = radius
  let radius = radius
})

@react.component
let make = () => {
  open AncestorCustom

  // highlight-start
  <Box bgColor=[#xs(#background)]>
    <Typography color=[#xs(#primary100), #md(#secondary100)]>
      {"Your text here..."->React.string}
    </Typography>
  </Box>
  // highlight-end
}
