open Ancestor.Default

@react.component
let make = () => {
  <Grid justifyContent=[#xs(#"space-between")] spacing=[#xs(1), #md(3)]>
    <Box columns=[#xs(#12), #md(#6)]>
      <div className="placeholder"> {"6"->React.string} </div>
    </Box>
    <Box columns=[#xs(#12), #md(#6)]>
      <div className="placeholder"> {"6"->React.string} </div>
    </Box>
    <Box columns=[#xs(#12)]> <div className="placeholder"> {"12"->React.string} </div> </Box>
    <Box columns=[#xs(#12), #md(#4)]>
      <div className="placeholder"> {"4"->React.string} </div>
    </Box>
    <Box columns=[#xs(#12), #md(#4)]>
      <div className="placeholder"> {"4"->React.string} </div>
    </Box>
    <Box columns=[#xs(#12), #md(#4)]>
      <div className="placeholder"> {"4"->React.string} </div>
    </Box>
  </Grid>
}
