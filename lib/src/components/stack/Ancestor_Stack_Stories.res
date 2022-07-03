open Ancestor.Default

let default = Ancestor_Storybook.story(~title="Components/Stack")

let basicUsage = () => {
  let placeholder = <Box width=[xs(3.2->#rem)] height=[xs(3.2->#rem)] bgColor=[xs(#hex("#000"))] />

  <Stack direction=[xs(#horizontal), md(#vertical)] spacing=[xs(1), md(3)]>
    placeholder placeholder placeholder placeholder placeholder
  </Stack>
}

let withDivider = () => {
  let placeholder =
    <Box width=[xs(100.0->#pct)] height=[xs(3.2->#rem)] bgColor=[xs(#hex("#cacaca"))] />

  <Stack
    p=[xs(2)]
    border=[(1->#px, #solid, #hex("#000"))->xs]
    maxW=[xs(32.0->#rem)]
    divider={<Base height=[xs(1->#px)] bgColor=[xs(#hex("#000"))] />}
    direction=[xs(#horizontal)]
    spacing=[xs(1), md(3)]>
    placeholder placeholder placeholder placeholder placeholder
  </Stack>
}
