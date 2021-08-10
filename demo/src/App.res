open Ancestor.Default

let s = React.string

@module("@emotion/css") external css: string => string = "css"
@module("@emotion/css") external global: string => unit = "injectGlobal"

let box = css(`
  background: rgba(0,0,0,0.1);
  border: solid 2px #000;
  border-radius: 6px;
  padding: 32px;
  color: #000;
  font-family: 'DM Sans';
  font-size: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
`)

@react.component
let make = () => {
  <Grid spacing=[xxs(2), md(6), lg(12)]>
    <Box columns=[xxs(#12), md(#4)]> <div className=box> {"4 columns"->s} </div> </Box>
    <Box columns=[xxs(#12), md(#4)]> <div className=box> {"4 columns"->s} </div> </Box>
    <Box columns=[xxs(#12), md(#4)]> <div className=box> {"4 columns"->s} </div> </Box>
    <Box columns=[xxs(#12)]> <div className=box> {"12 columns"->s} </div> </Box>
  </Grid>
}
