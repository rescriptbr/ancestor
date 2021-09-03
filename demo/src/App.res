open Ancestor.Default

let s = React.string

@module("@emotion/css") external css: string => string = "css"
@module("@emotion/css") external global: string => unit = "injectGlobal"

@react.component
let make = () => {
  <Grid spacing=[xs(2)]>
    <Box columns=[xs(#12), md(#4)] color=[xs(#hex("#fafafa"))] bgColor=[xs(#hex("#000"))]>
      {"4 columns"->s}
    </Box>
    <Box columns=[xs(#12), md(#4)] color=[xs(#hex("#fafafa"))] bgColor=[xs(#hex("#000"))]>
      {"4 columns"->s}
    </Box>
  </Grid>
}
