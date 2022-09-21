let default = Ancestor_Storybook.story(
  ~title="Hooks/useResponsiveValue",
  ~excludeStories=["Card"],
  (),
)

open Ancestor

module Card = {
  @react.component
  let make = (~color, ~label) =>
    <Box p={xs: 3} fontSize={xs: 24->#px} color={xs: "#fafafa"->#hex} bgColor={xs: color}>
      {label->React.string}
    </Box>
}

let basicUsage = () => {
  let color = Ancestor.useResponsiveValue("#000"->#hex, {xs: "#000"->#hex, md: "#716e6e"->#hex})
  let label = Ancestor.useResponsiveValue(
    "Default",
    {xs: "Mobile", sm: "Small", md: "Tablet", lg: "Large", xl: "Extra Large"},
  )

  <Box>
    <Card color label />
  </Box>
}
