open Ancestor

@react.component
let make = () => {
  <Base tag=#footer onClick={_ => Js.log("test")} p=[xxs(2)]> <img /> </Base>
}
