let default = Storybook.story(~title="Basic usage", ~excludeStories=["CustomCss"], ())
module CustomCss = AncestorCss.Make(
  AncestorCss.Defaults.Breakpoints,
  {
    type colors = [#primary | #secondary]
    let colors = (x: colors) =>
      switch x {
      | #primary => #hex("fc0")
      | #secondary => #hex("363636")
      }
  },
  AncestorCss.Defaults.Spacing,
  AncestorCss.Defaults.Radius,
  AncestorCss.Defaults.ZIndex,
  AncestorCss.Defaults.Typography,
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
