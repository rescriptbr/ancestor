open Ancestor.Default

let default = Ancestor_Storybook.story(~title="Components/Grid", ())

let basicUsage = () => {
  let placeholder = Ancestor_Emotion.css(`
    padding: 32px;
    border: solid 2px #f36;
    background: #ff336629;
    text-align: center;
    font-weight: 700;
    color: #f36;
    border-radius: 4px;
    font-size: 1.8rem;
    width: 100%;
  `)
  <Box p=[xs(4)]>
    <Grid justifyContent=[#xs(#"space-between")] spacing=[#xs(1), #md(3)]>
      <Box columns=[#xs(#12), #md(#6)]>
        <div className=placeholder> {"6"->React.string} </div>
      </Box>
      <Box columns=[#xs(#12), #md(#6)]>
        <div className=placeholder> {"6"->React.string} </div>
      </Box>
      <Box columns=[#xs(#12)]> <div className=placeholder> {"12"->React.string} </div> </Box>
      <Box columns=[#xs(#12), #md(#4)]>
        <div className=placeholder> {"4"->React.string} </div>
      </Box>
      <Box columns=[#xs(#12), #md(#4)]>
        <div className=placeholder> {"4"->React.string} </div>
      </Box>
      <Box columns=[#xs(#12), #md(#4)]>
        <div className=placeholder> {"4"->React.string} </div>
      </Box>
    </Grid>
  </Box>
}
