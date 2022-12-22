open Ancestor

let default = Ancestor_Storybook.story(~title="Components/Box", ())

let basicUsage = () => {
  let s = React.string

  <Box p={xs: 4}>
    <Box
      _after={
        width: {xs: #px(200)},
      }
      borderRadius={xs: 1}
      bgColor={xs: #hex("#000")}
      p={xs: 4}
      display={xs: #flex}
      justifyContent={xs: #"flex-start", lg: #"space-between"}
      alignItems={xs: #center}
      flexDirection={xs: #column, lg: #row}>
      <Box mr={xs: 0, lg: 3}>
        <Typography
          mb={xs: 1}
          textAlign={xs: #center, md: #left}
          fontSize={xs: 2.8->#rem}
          color={xs: #hex("#fff")}
          tag=#h1>
          {`Start using right now`->s}
        </Typography>
        <Typography
          textAlign={xs: #center, md: #left}
          fontSize={xs: 2.0->#rem}
          fontWeight={xs: #300}
          color={xs: #hex("#b1b1b1")}
          lineHeight={xs: 2.8->#rem}
          tag=#p>
          {`Ancestor is production-ready and actively maintained. It’s used in production projects daily and keep breaking changes to a minimum whereever possible.`->s}
        </Typography>
      </Box>
    </Box>
  </Box>
}
