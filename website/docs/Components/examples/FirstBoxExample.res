open Ancestor

@react.component
let make = () => {
  <Box
    bgColor=[xs(#hex("#000"))]
    p=[xs(3), md(4)]
    display=[xs(#flex)]
    justifyContent=[xs(#"flex-start"), lg(#"space-between")]
    alignItems=[xs(#center)]
    flexDirection=[xs(#column), lg(#row)]>
    <Box mr=[xs(0), lg(6)] mb=[xs(2), lg(0)]>
      <Typography
        textAlign=[xs(#center), lg(#left)]
        color=[xs(#hex("#fff"))]
        mb=[xs(0)]
        tag=#h1
        fontSize=[xs(24->#px), md(32->#px)]
        m=[xs(0)]>
        {`Start using right now`->React.string}
      </Typography>
      <Typography
        textAlign=[xs(#center), lg(#left)]
        color=[xs(#hex("#b1b1b1"))]
        tag=#p
        m=[xs(0)]
        lineHeight=[xs(20->#px)]>
        {`Ancestor is production-ready and actively maintained. It’s used in production projects daily and keep breaking changes to a minimum whereever possible.`->React.string}
      </Typography>
    </Box>
    <Base
      bgColor=[xs(#hex("#fafafa"))]
      borderStyle=[xs(#none)]
      fontSize=[xs(18->#px)]
      width=[xs(256->#px)]
      height=[xs(48->#px)]
      borderRadius=[xs(3)]
      fontWeight=[xs(#600)]
      tag=#button>
      {"Let's start"->React.string}
    </Base>
  </Box>
}
