open Ancestor.Default

@react.component
let make = () => {
  <Flex>
    <Base column=[#xxs(#12), #md(#6)]> <div /> </Base>
    <Base column=[#xxs(#12), #md(#6)]> <div /> </Base>
  </Flex>
}
