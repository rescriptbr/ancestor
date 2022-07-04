open Ancestor
open Ancestor_Helpers

let default = Ancestor_Storybook.story(~title="Components/Stack")

let \"BasicUsage" = () => {
  <Stack
    maxW=[xs(32.0->#rem)]
    p=[xs(2)]
    borderRadius=[xs(1)]
    border=[(2->#px, #solid, Colors.gray1)->xs]
    direction=[xs(#horizontal)]
    spacing=[xs(2), md(3)]>
    <Placeholder width=[xs(100.0->#pct)] />
    <Placeholder width=[xs(100.0->#pct)] />
    <Placeholder width=[xs(100.0->#pct)] />
  </Stack>
}

let \"WithDivider" = () => {
  <Stack
    p=[xs(2)]
    borderRadius=[xs(1)]
    alignItems=[md(#center)]
    border=[(1->#px, #solid, Colors.gray1)->xs]
    divider={<Base height=[xs(2->#px)] width=[md(2.4->#rem)] bgColor=[xs(#hex("#000"))] />}
    direction=[xs(#horizontal), md(#vertical)]
    spacing=[xs(4), md(3)]>
    <Placeholder width=[xs(100.0->#pct), md(7.2->#rem)] />
    <Placeholder width=[xs(100.0->#pct), md(7.2->#rem)] />
    <Placeholder width=[xs(100.0->#pct), md(7.2->#rem)] />
  </Stack>
}
