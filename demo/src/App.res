open Ancestor

let s = React.string

@module("@emotion/css") external css: string => string = "css"
@module("@emotion/css") external global: string => unit = "injectGlobal"

@react.component
let make = () => {
  <Box>
    <Base tag=#a href="test" textDecoration=[xs(#none)]> {"Test"->React.string} </Base>
    <Box display=[xs(#flex)] gap=[xs(#one(3.2->#rem))]>
      <Box width=[xs(50->#px)] height=[xs(50->#px)] bgColor=[xs(#hex("#000"))] />
      <Box width=[xs(50->#px)] height=[xs(50->#px)] bgColor=[xs(#hex("#000"))] />
      <Box width=[xs(50->#px)] height=[xs(50->#px)] bgColor=[xs(#hex("#000"))] />
    </Box>
  </Box>
}
