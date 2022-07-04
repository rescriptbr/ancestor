open Ancestor

@react.component
let make = () => {
  <Grid justifyContent=[#xs(#"space-between")] spacing=[#xs(1), #md(3)]>
    <Box columns=[#xs(#12), #md(#6)]>
      <Placeholder width=[xs(100.0->#pct)]> {"6"->React.string} </Placeholder>
    </Box>
    <Box columns=[#xs(#12), #md(#6)]>
      <Placeholder width=[xs(100.0->#pct)]> {"6"->React.string} </Placeholder>
    </Box>
    <Box columns=[#xs(#12)]>
      <Placeholder width=[xs(100.0->#pct)]> {"12"->React.string} </Placeholder>
    </Box>
    <Box columns=[#xs(#12), #md(#4)]>
      <Placeholder width=[xs(100.0->#pct)]> {"xs 12 / md 4"->React.string} </Placeholder>
    </Box>
    <Box columns=[#xs(#12), #md(#4)]>
      <Placeholder width=[xs(100.0->#pct)]> {"xs 12 / md 4"->React.string} </Placeholder>
    </Box>
    <Box columns=[#xs(#12), #md(#4)]>
      <Placeholder width=[xs(100.0->#pct)]> {"xs 12 / md 4"->React.string} </Placeholder>
    </Box>
  </Grid>
}
