open Ancestor

@react.component
let make = (
  ~children=React.null,
  ~bgColor=[xs(Theme.Colors.black)],
  ~width=[xs(7.2->#rem)],
  ~height=[xs(7.2->#rem)],
) =>
  <Box
    lineHeight=[xs(1.6->#rem)]
    textAlign=[xs(#center)]
    display=[xs(#flex)]
    alignItems=[xs(#center)]
    justifyContent=[xs(#center)]
    fontSize=[xs(18->#px)]
    fontWeight=[xs(#700)]
    width
    height
    color=[xs(Theme.Colors.white)]
    borderRadius=[xs(1)]
    bgColor>
    children
  </Box>
