module AncestorCustom = Ancestor.Make({
  open Ancestor.DefaultConfig

  type breakpoints<'value> = breakpoints<'value>
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type spacing = spacing
  let spacing = spacing

  type zIndex = zIndex
  let zIndex = zIndex

  type colors = colors
  let colors = colors

  // highlight-start
  type radius = Ancestor_Css.Length.t
  let radius = v => v
  // highlight-end
})

@react.component
let make = () => {
  open AncestorCustom

  // highlight-start
  <Box borderRadius=[#xs(24->#px)]> <Box borderRadius=[#xs(32->#px)] /> </Box>
  // highlight-end
}
