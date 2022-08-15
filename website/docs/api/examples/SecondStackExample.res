open Ancestor

module Divider = {
  @react.component
  let make = () => <Box height=[xs(2->#px)] bgColor=[xs(#hex("#cecece"))] />
}

@react.component
let make = () => {
  <Box display=[xs(#flex)] justifyContent=[xs(#center)]>
    <Box maxW=[md(300->#px)] width=[xs(100.0->#pct)]>
      <Stack spacing=[xs(3)] divider={<Divider />}>
        <Placeholder width=[xs(100.0->#pct)]> {"Item"->React.string} </Placeholder>
        <Placeholder width=[xs(100.0->#pct)]> {"Item"->React.string} </Placeholder>
        <Placeholder width=[xs(100.0->#pct)]> {"Item"->React.string} </Placeholder>
      </Stack>
    </Box>
  </Box>
}
