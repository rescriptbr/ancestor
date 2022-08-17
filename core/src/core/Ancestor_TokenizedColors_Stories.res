let default = Ancestor_Storybook.story(
  ~title="Core/TokenizedColors",
  ~excludeStories=["TokenizedColors"],
  (),
)

module TokenizedColors = Ancestor.Make({
  type breakpoints<'a> = [#xs('a) | #md('a) | #lg('a)]
  type spacing = int
  type radius = int
  type zIndex = int
  type colors = [#primary | #secondary]

  let colors = v =>
    switch v {
    | #primary => #hex("#000")
    | #secondary => #hex("#cecece")
    }

  let zIndex = v => v
  let spacing = spacing => #px(spacing * 8)
  let radius = radius => #px(radius * 8)

  let sizeByBreakpoints = values =>
    switch values {
    | #xs(_) => 0
    | #md(_) => 920
    | #lg(_) => 1280
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #xs(v) => v
    | #md(v) => v
    | #lg(v) => v
    }

  let css = Ancestor_Emotion.css
})

let \"Overview" = () => {
  open TokenizedColors

  <Stack spacing=[#xs(2)]>
    <Box borderRadius=[#xs(2)] width=[#xs(56->#px)] height=[#xs(56->#px)] bgColor=[#xs(#primary)] />
    <Box
      borderRadius=[#xs(2)] width=[#xs(56->#px)] height=[#xs(56->#px)] bgColor=[#xs(#secondary)]
    />
  </Stack>
}
