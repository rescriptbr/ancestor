open Ancestor

module Card = {
  @react.component
  let make = (~color, ~label) =>
    <Box
      borderRadius=[xs(1)]
      p=[xs(3)]
      fontSize=[xs(24->#px)]
      color=[xs("#fafafa"->#hex)]
      bgColor=[xs(color)]>
      {label->React.string}
    </Box>
}

@react.component
let make = () => {
  let color = Ancestor.useResponsiveValue(
    Theme.Colors.black,
    [xs(Theme.Colors.gray1), md(Theme.Colors.black)],
  )
  let label = Ancestor.useResponsiveValue(
    "Default",
    [
      xs("This text appears on xs"),
      md("This text text appears on sm"),
      lg("This text appears on lg"),
    ],
  )

  <Card color label />
}
