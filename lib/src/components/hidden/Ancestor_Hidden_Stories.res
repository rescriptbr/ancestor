open Ancestor
open Ancestor_Helpers

let default = Ancestor_Storybook.story(~title="Components/Hidden")

let basicUsage = () => {
  <Box>
    <Hidden on=[xs(true), md(false)]>
      <Placeholder width=[xs(224->#px)]> {"Only visible above md"->React.string} </Placeholder>
    </Hidden>
    <Hidden on=[md(true)]>
      <Placeholder width=[xs(224->#px)]> {"Only visible below md"->React.string} </Placeholder>
    </Hidden>
  </Box>
}
