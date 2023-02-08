let default = Storybook.story(~title="Basic usage", ~excludeStories=["CustomCss"], ())
module CustomCss = AncestorCss.Make(
  {
    type breakpoints = [#xs | #sm]
    let sizeByBreakpoints = v =>
      switch v {
      | #xs => 0
      | #sm => 470
      }
  },
  {
    type colors = [#primary | #secondary]
    let colors = (x: colors) =>
      switch x {
      | #primary => #hex("fc0")
      | #secondary => #hex("363636")
      }
  },
  {
    type spacing = int
    let spacing = v => #px(v * 8)
  },
  {
    type radius = int
    let radius = v => #px(v * 8)
  },
  {
    type zIndex = int
    let zIndex = v => v
  },
)

let overview = () => {
  open CustomCss

  let className = style(. [
    width(124->#px),
    height(124->#px),
    breakpoint(
      #sm,
      [
        bgColor(#primary),
        padding(4),
        borderRadius(2),
        border(1->#px, #solid, #primary),
        width(300->#px),
        height(300->#px),
      ],
    ),
  ])

  <div className />
}
