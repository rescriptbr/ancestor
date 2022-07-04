open Ancestor

let \"Wrapper" = props => {
  <Box
    overflow=[xs(#hidden)]
    position=[xs(#relative)]
    border=[(1->#px, #solid, #hex("#cecece"))->xs]
    p=[xs(2), md(4)]
    bgColor=[xs(#hex("#fff"))]
    borderRadius=[xs(1)]>
    {props["children"]}
  </Box>
}
