let default = Ancestor_Storybook.story(
  ~title="Core/TokenizedColors",
  ~excludeStories=["TokenizedColors"],
  (),
)

module TokenizedColors = Ancestor.Make({
  open Ancestor.DefaultConfig

  type breakpoints<'a> = breakpoints<'a>
  type fields = fields
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
  let sizeByBreakpoints = sizeByBreakpoints
  let encode = encode
  let css = Ancestor_Emotion.css
})

let \"Overview" = () => {
  open TokenizedColors

  <Stack spacing={xs: 2}>
    <Box borderRadius={xs: 2} width={xs: 56->#px} height={xs: 56->#px} bgColor={xs: #primary} />
    <Box borderRadius={xs: 2} width={xs: 56->#px} height={xs: 56->#px} bgColor={xs: #secondary} />
  </Stack>
}
