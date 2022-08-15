open Ancestor

@react.component
let make = () => {
  <Stack direction=[xs(#horizontal)] gap=[xs(#one(2))]>
    <Hidden on=[md(true)]> <Placeholder> {"Visible below md"->React.string} </Placeholder> </Hidden>
    <Placeholder bgColor=[xs(Theme.Colors.gray2)]> {"Always visible"->React.string} </Placeholder>
    <Hidden on=[xs(true), md(false)]>
      <Placeholder bgColor=[xs(Theme.Colors.pink)]> {"Hidden below md"->React.string} </Placeholder>
    </Hidden>
  </Stack>
}
