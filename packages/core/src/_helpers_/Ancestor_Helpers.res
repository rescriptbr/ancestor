open Ancestor

module Colors = {
  let gray1 = #hex("#616161")
  let gray2 = #hex("#d4d4d4")
}

module Placeholder = {
  @react.component
  let make = (~children=React.null, ~width={xs: 7.2->#rem}, ~height={xs: 7.2->#rem}) =>
    <Box
      width
      height
      fontSize={xs: 12->#px}
      fontWeight={xs: #700}
      display={xs: #flex}
      justifyContent={xs: #center}
      alignItems={xs: #center}
      borderRadius={xs: 1}
      border={xs: (2->#px, #solid, Colors.gray1)}
      bgColor={xs: Colors.gray2}>
      children
    </Box>
}
