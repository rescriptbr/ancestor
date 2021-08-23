open Ancestor.Default

let s = React.string

@module("@emotion/css") external css: string => string = "css"
@module("@emotion/css") external global: string => unit = "injectGlobal"

@react.component
let make = () => {
  <Grid spacing=[xxs(2)]>
    <Box columns=[xxs(#12), md(#4)] color=[xxs(#hex("#fafafa"))] bgColor=[xxs(#hex("#000"))]>
      {"4 columns"->s}
    </Box>
    <Box columns=[xxs(#12), md(#4)] color=[xxs(#hex("#fafafa"))] bgColor=[xxs(#hex("#000"))]>
      {"4 columns"->s}
    </Box>
  </Grid>
}
