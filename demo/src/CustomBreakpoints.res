module AncestorCustom = Ancestor.Make({
  type breakpoints<'value> = [
    | #small('value)
    | #medium('value)
    | #large('value)
  ]

  let sizeByBreakpoints = values =>
    switch values {
    | #small(_) => 600
    | #medium(_) => 920
    | #large(_) => 1280
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #small(v) => v
    | #medium(v) => v
    | #large(v) => v
    }

  let spacing = Ancestor.DefaultConfig.spacing
  let css = Ancestor.DefaultConfig.css
})

module App = {
  open AncestorCustom

  @react.component
  let make = () => {
    <Grid> <Box columns=[#small(#12), #medium(#6)]> {React.string("...")} </Box> </Grid>
  }
}
