module AncestorCustom = Ancestor.Make({
  open Ancestor.DefaultConfig

  // highlight-start
  type breakpoints<'value> = [
    | #small('value)
    | #medium('value)
    | #large('value)
  ]

  let sizeByBreakpoints = values =>
    switch values {
    | #small(_) => 0
    | #medium(_) => 600
    | #large(_) => 1280
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #small(v) => v
    | #medium(v) => v
    | #large(v) => v
    }
  // highlight-end

  type spacing = spacing
  let spacing = spacing

  type radius = radius
  let radius = radius

  type colors = colors
  let colors = colors

  type zIndex = zIndex
  let zIndex = zIndex

  let css = Ancestor.DefaultConfig.css
})

module App = {
  open AncestorCustom

  @react.component
  let make = () => {
    <Grid>
      <Box columns=[#small(#12), #medium(#6)]> {"Your components here..."->React.string} </Box>
    </Grid>
  }
}
