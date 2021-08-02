open Ancestor.Default

@react.component
let make = () => {
  <Flex>
    <Base column=[#xxs(#12), #md(#6)]> <div /> </Base>
    <Base column=[#xxs(#12), #md(#6)]> <div /> </Base>
  </Flex>
}

module CustomConfig = {
  module UI = Ancestor.Make({
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

  open UI

  @react.component
  let make = () => {
    <Flex>
      <Flex>
        <Base column=[#tablet(#12), #desktop(#6)]> <div /> </Base>
        <Base column=[#tablet(#12), #desktop(#6)]> <div /> </Base>
      </Flex>
    </Flex>
  }
}
