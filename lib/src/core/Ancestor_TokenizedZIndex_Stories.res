let default = Ancestor_Storybook.story(
  ~title="Core/TokenizedIndex",
  ~excludeStories=["TokenizedIndex"],
  (),
)

module TokenizedIndex = Ancestor.Make({
  open Ancestor.DefaultConfig

  type breakpoints<'value> = breakpoints<'value>
  type radius = radius
  type spacing = spacing
  type colors = colors
  type zIndex = [
    | #base
    | #above
    | #aboveAll
    | #hidden
  ]

  let unboxBreakpointValue = unboxBreakpointValue
  let sizeByBreakpoints = sizeByBreakpoints

  let css = css
  let radius = radius
  let spacing = spacing
  let colors = colors
  let zIndex = token =>
    switch token {
    | #base => 5
    | #above => 10
    | #aboveAll => 20
    | #hidden => -1
    }
})

let overview = () => {
  open TokenizedIndex

  <Box
    p=[#xs(2)] position=[#xs(#relative)] className={Ancestor_Emotion.css(`> * { opacity: 0.5; }`)}>
    <Box
      width=[#xs(56->#px)]
      height=[#xs(56->#px)]
      bgColor=[#xs(#hex("#012000"))]
      position=[#xs(#absolute)]
      left=[#xs(#zero)]
    />
    <Box
      width=[#xs(56->#px)]
      height=[#xs(56->#px)]
      bgColor=[#xs(#hex("#ff0000"))]
      position=[#xs(#absolute)]
      zIndex=[#xs(#above)]
      left=[#xs(32->#px)]
    />
    <Box
      width=[#xs(56->#px)]
      height=[#xs(56->#px)]
      bgColor=[#xs(#hex("#008000"))]
      position=[#xs(#absolute)]
      left=[#xs(64->#px)]
    />
  </Box>
}
