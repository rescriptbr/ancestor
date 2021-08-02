open Ancestor.Default

@react.component
let make = () => {
  <Flex>
    <Box size=[#xxs(#12), #md(#6)]> <div /> </Box> <Box size=[#xxs(#12), #md(#6)]> <div /> </Box>
  </Flex>
}

module CustomAncestor = Ancestor.Make({
  type breakpoints<'a> = [#smartphone('a) | #tablet('a) | #desktop('a)]

  let spacing = 4.0

  let sizeByBreakpoints = values =>
    switch values {
    | #smartphone(_) => 0
    | #tablet(_) => 720
    | #desktop(_) => 1280
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #smartphone(v) => v
    | #tablet(v) => v
    | #desktop(v) => v
    }
})

module CustomConfig = {
  open! CustomAncestor

  @react.component
  let make = () => {
    <Flex>
      <Box size=[#tablet(#12), #desktop(#6)]> <div /> </Box>
      <Box size=[#tablet(#12), #desktop(#6)]> <div /> </Box>
    </Flex>
  }
}
