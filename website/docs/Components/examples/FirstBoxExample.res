let s = React.string

module Button = {
  open Ancestor.Default

  let button = Emotion.css({
    "height": "42px",
    "padding": "0 12px",
    "minWidth": "200px",
    "backgroundColor": "white",
    "outline": "none",
    "borderRadius": "32px",
    "boxShadow": "none",
    "border": "none",
    "fontSize": "16px",
  })

  @react.component
  let make = (~children) => {
    <Base className=button tag=#button> {children->s} </Base>
  }
}
// hidden-end
open Ancestor.Default

@react.component
let make = () => {
  <Box
    bgColor=[xs(#hex("#000"))]
    p=[xs(3)]
    display=[xs(#flex)]
    justifyContent=[xs(#"flex-start"), lg(#"space-between")]
    alignItems=[xs(#center)]
    flexDirection=[xs(#column), lg(#row)]>
    <Box mr=[xs(0), lg(3)]>
      <Typography textAlign=[xs(#center), lg(#left)] color=[xs(#hex("#fff"))] tag=#h1>
        {`Start using right now`->s}
      </Typography>
      <Typography textAlign=[xs(#center), lg(#left)] color=[xs(#hex("#b1b1b1"))] tag=#p>
        {`Ancestor is production-ready and actively maintained. It’s used in production projects daily and keep breaking changes to a minimum whereever possible.`->s}
      </Typography>
    </Box>
    <Button> "Let's start" </Button>
  </Box>
}
