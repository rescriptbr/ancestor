open Ancestor

let s = React.string

@module("@emotion/css") external css: string => string = "css"
@module("@emotion/css") external global: string => unit = "injectGlobal"

@react.component
let make = () => {
  <Box> <Typography> {"Teste"->s} </Typography> </Box>
}
