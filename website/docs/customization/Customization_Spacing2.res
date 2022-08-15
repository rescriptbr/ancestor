module AncestorCustom = Ancestor.Make({
  open Ancestor.DefaultConfig

  type breakpoints<'value> = breakpoints<'value>
  let sizeByBreakpoints = sizeByBreakpoints
  let unboxBreakpointValue = unboxBreakpointValue

  //highlight-start
  type spacing = float
  let spacing = v => #pxFloat(v *. 8.0)
  //highlight-end

  type radius = radius
  let radius = radius

  type colors = colors
  let colors = colors

  type zIndex = zIndex
  let zIndex = zIndex

  let css = Ancestor.DefaultConfig.css
})

@react.component
let make = () => {
  open AncestorCustom

  //highlight-start
  <Box m=[#md(2.25)]> <Box p=[#xs(4.0), #md(3.0)] /> </Box>
  //highlight-end
}
