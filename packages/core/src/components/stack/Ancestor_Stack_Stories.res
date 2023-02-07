open Ancestor
open Ancestor_Helpers

let default = Storybook.story(~title="Components/Stack", ())

let \"BasicUsage" = () => {
  <Stack
    maxW={xs: 32.0->#rem}
    p={xs: 2}
    borderRadius={xs: 1}
    border={xs: (2->#px, #solid, Colors.gray1)}
    direction={xs: #horizontal}
    gap={xs: 2, md: 4}>
    <Placeholder width={xs: 100.0->#percent} />
    <Placeholder width={xs: 100.0->#percent} />
    <Placeholder width={xs: 100.0->#percent} />
  </Stack>
}

let \"WithDivider" = () => {
  <Stack
    p={xs: 2}
    borderRadius={xs: 1}
    alignItems={md: #center}
    border={xs: (1->#px, #solid, Colors.gray1)}
    divider={<Base height={xs: 2->#px} width={md: 2.4->#rem} bgColor={xs: #hex("#000")} />}
    direction={xs: #horizontal, md: #vertical}
    gap={xs: 2, md: 4}>
    <Placeholder width={xs: 100.0->#percent, md: 7.2->#rem} />
    <Placeholder width={xs: 100.0->#percent, md: 7.2->#rem} />
    <Placeholder width={xs: 100.0->#percent, md: 7.2->#rem} />
  </Stack>
}
