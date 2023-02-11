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
  {
    include AncestorCss.Defaults.TextShadows
    type boxShadow = [
      | #simple
      | #cool
    ]

    let boxShadow = x =>
      switch x {
      | #simple => CssJs.Shadow.box(~x=1->#px, ~y=2->#px, #hex("363636"))
      | #cool => #var("--cool-shadow")
      }
  },
)

let overview = () => {
  open CustomCss

  let className = style(. [
    width(124->#px),
    height(124->#px),
    boxShadow(#cool),
    bgColor(#secondary),
    fontSize(24->#px),
    breakpoint(
      #sm,
      [
        boxShadow(#simple),
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
