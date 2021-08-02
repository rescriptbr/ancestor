open Ancestor.Default
let s = React.string

@react.component
let make = () => {
  <div>
    <Hidden on=[#xxs(true), #md(false)] mode=#js> <div> {`hidden on mobile`->s} </div> </Hidden>
    <Hidden on=[#xxs(false), #md(true)] mode=#js> <div> {`hidden on mdUp`->s} </div> </Hidden>
  </div>
}
