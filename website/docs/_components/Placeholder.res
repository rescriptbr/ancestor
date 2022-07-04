open Ancestor

@react.component
let make = (~children=React.null, ~width=[xs(7.2->#rem)], ~height=[xs(7.2->#rem)]) =>
  <Box
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    justifyContent=[xs(#center)]
    fontSize=[xs(18->#px)]
    fontWeight=[xs(#700)]
    width
    height
    color=[xs(Theme.Colors.white)]
    borderRadius=[xs(1)]
    bgColor=[xs(Theme.Colors.black)]>
    children
  </Box>
