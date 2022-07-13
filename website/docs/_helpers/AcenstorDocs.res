module SpacingWithTokens = Ancestor.Make({
  type breakpoints<'value> = Ancestor.DefaultConfig.breakpoints<'value>
  type radius = Ancestor.DefaultConfig.radius
  let radius = Ancestor.DefaultConfig.radius
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type spacing = [#xs | #md | #lg]
  let spacing = v =>
    switch v {
    | #xs => #px(8)
    | #md => #px(16)
    | #lg => #px(24)
    }
})

module SpacingWithFloat = Ancestor.Make({
  type breakpoints<'value> = Ancestor.DefaultConfig.breakpoints<'value>
  type radius = Ancestor.DefaultConfig.radius
  let radius = Ancestor.DefaultConfig.radius
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type spacing = float
  let spacing = v => #pxFloat(v *. 8.0)
})

module SpacingWithCssUnits = Ancestor.Make({
  type breakpoints<'value> = Ancestor.DefaultConfig.breakpoints<'value>
  type radius = Ancestor.DefaultConfig.radius
  let radius = Ancestor.DefaultConfig.radius
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type spacing = Ancestor_Css.Length.t
  let spacing = v => v
})

@react.component
let make = () => {
  <Ancestor.Box m=[#xs(3)]>
    <SpacingWithFloat.Box p=[#xs(4.0), #md(3.0)] />
    <SpacingWithTokens.Box p=[#xs(#xs), #md(#lg)] />
    <SpacingWithCssUnits.Box p=[#xs(#px(32))] />
  </Ancestor.Box>
}
