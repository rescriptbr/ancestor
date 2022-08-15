open Ancestor

@react.component
let make = () => {
  <Box display=[xs(#flex)] justifyContent=[xs(#center)]>
    <Box maxW=[md(300->#px)] width=[xs(100.0->#pct)]>
      <Stack spacing=[xs(2)] direction=[xs(#horizontal), md(#vertical)]>
        <Placeholder width=[xs(100.0->#pct)]> {"Item"->React.string} </Placeholder>
        <Placeholder width=[xs(100.0->#pct)]> {"Item"->React.string} </Placeholder>
        <Placeholder width=[xs(100.0->#pct)]> {"Item"->React.string} </Placeholder>
      </Stack>
    </Box>
  </Box>
}
