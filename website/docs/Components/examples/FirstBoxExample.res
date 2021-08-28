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
    bgColor=[xxs(#hex("#000"))]
    p=[xxs(3)]
    display=[xxs(#flex)]
    justifyContent=[xxs(#"flex-start"), lg(#"space-between")]
    alignItems=[xxs(#center)]
    flexDirection=[xxs(#column), lg(#row)]>
    <Box mr=[xxs(0), lg(3)]>
      <Base textAlign=[xxs(#center), lg(#left)] color=[xxs(#hex("#fff"))] tag=#h1>
        {`Start using right now`->s}
      </Base>
      <Base textAlign=[xxs(#center), lg(#left)] color=[xxs(#hex("#b1b1b1"))] tag=#p>
        {`Ancestor is production-ready and actively maintained. It’s used in production projects daily and keep breaking changes to a minimum whereever possible.`->s}
      </Base>
    </Box>
    <Button> "Let's start" </Button>
  </Box>
}
