module AncestorCustom = Ancestor.Make({
  open Ancestor.DefaultConfig

  type breakpoints<'value> = breakpoints<'value>
  let sizeByBreakpoints = sizeByBreakpoints
  let unboxBreakpointValue = unboxBreakpointValue

  //highlight-start
  type spacing = [#xs | #md | #lg]
  let spacing = v =>
    switch v {
    | #xs => #px(8)
    | #md => #px(16)
    | #lg => #px(24)
    }
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

  <Box m=[#md(#lg)]> <Box p=[#xs(#md), #md(#lg)] /> </Box>
}
