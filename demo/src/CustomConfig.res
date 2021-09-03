let s = React.string

module Custom = Ancestor.Make({
  include Ancestor.DefaultConfig

  let spacing = 4.0
  let radius = 4.0
  @module("goober") external css: string => string = "css"
})

open Custom

@react.component
let make = () => {
  <Base width=[#xs(100.0->#rem)]> {"Testing"->s} </Base>
}
