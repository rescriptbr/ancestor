open Ancestor.Default

@react.component
let make = () => {
  <Grid justifyContent=[#xxs(#"space-between")] spacing=[xxs(1)]>
    <Box columns=[#xxs(#12), #md(#6)]>
      <div className="placeholder"> {"6"->React.string} </div>
    </Box>
    <Box columns=[#xxs(#12), #md(#6)]>
      <div className="placeholder"> {"6"->React.string} </div>
    </Box>
    <Box columns=[#xxs(#12)]> <div className="placeholder"> {"12"->React.string} </div> </Box>
    <Box columns=[#xxs(#12), #md(#4)]>
      <div className="placeholder"> {"4"->React.string} </div>
    </Box>
    <Box columns=[#xxs(#12), #md(#4)]>
      <div className="placeholder"> {"4"->React.string} </div>
    </Box>
    <Box columns=[#xxs(#12), #md(#4)]>
      <div className="placeholder"> {"4"->React.string} </div>
    </Box>
  </Grid>
}
