open Ancestor.Default

let s = React.string

@module("@emotion/css") external css: string => string = "css"
@module("@emotion/css") external global: string => unit = "injectGlobal"

@react.component
let make = () => {
  <Box>
    <Typography fontSize=[xs(#calc(10->#px, #add, 0.5->#rem))]> {"Teste"->s} </Typography>
  </Box>
}
