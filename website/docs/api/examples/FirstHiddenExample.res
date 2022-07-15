open Ancestor

@react.component
let make = () => {
  <Box display=[xs(#flex)] gap=[xs(2->#one)]>
    <Hidden on=[md(true)]> <Placeholder> {"Visible below md"->React.string} </Placeholder> </Hidden>
    <Hidden on=[xs(true), md(false)]>
      <Placeholder bgColor=[xs(Theme.Colors.gray2)]>
        {"Hidden below md"->React.string}
      </Placeholder>
    </Hidden>
  </Box>
}
