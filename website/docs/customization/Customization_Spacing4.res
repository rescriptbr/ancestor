module AncestorCustom = Ancestor.Make({
  open Ancestor.DefaultConfig

  type breakpoints<'value> = breakpoints<'value>
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type zIndex = zIndex
  let zIndex = zIndex

  type colors = colors
  let colors = colors

  type radius = radius
  let radius = radius

  // highlight-start
  type spacing = Ancestor_Css.Length.t
  let spacing = v => v
  // highlight-end
})

@react.component
let make = () => {
  open AncestorCustom

  // highlight-start
  <Box m=[#xs(24->#px)]> <Box p=[#xs(32->#px)] /> </Box>
  // highlight-end
}
