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
    type colors = [#primary]
    let colors = (x: colors) =>
      switch x {
      | #primary => #hex("fc0")
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
    breakpoint(#xs, [backgroundColor(#primary)]),
    breakpoint(#xs, [padding(1)]),
  ])

  <div className />
}
