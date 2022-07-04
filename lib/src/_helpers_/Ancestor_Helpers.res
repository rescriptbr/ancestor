open Ancestor.Default

module Colors = {
  let gray1 = #hex("#616161")
  let gray2 = #hex("#d4d4d4")
}

module Placeholder = {
  @react.component
  let make = (~children=React.null, ~width=[xs(7.2->#rem)], ~height=[xs(7.2->#rem)]) =>
    <Box
      width
      height
      borderRadius=[xs(1)]
      border=[(2->#px, #solid, Colors.gray1)->xs]
      bgColor=[xs(Colors.gray2)]>
      children
    </Box>
}
