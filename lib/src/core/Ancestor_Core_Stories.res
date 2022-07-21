let default = Ancestor_Storybook.story(~title="API/Core", ~excludeStories=["CustomColors"], ())

module CustomColors = Ancestor.Make({
  type breakpoints<'a> = [#xs('a) | #sm('a) | #md('a) | #lg('a) | #xl('a)]
  type spacing = int
  type radius = int
  type colors = [#primary | #secondary]

  let colors = v =>
    switch v {
    | #primary => #hex("#000")
    | #secondary => #hex("#cecece")
    }

  let spacing = spacing => #px(spacing * 8)
  let radius = radius => #px(radius * 8)

  let sizeByBreakpoints = values =>
    switch values {
    | #xs(_) => 0
    | #sm(_) => 475
    | #md(_) => 920
    | #lg(_) => 1280
    | #xl(_) => 1920
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #xs(v) => v
    | #sm(v) => v
    | #md(v) => v
    | #lg(v) => v
    | #xl(v) => v
    }

  let css = Ancestor_Emotion.css
})

let basicUsage = () => {
  <CustomColors.Box width=[#xs(56->#px)] height=[#xs(56->#px)] bgColor=[#xs(#primary)] />
}

Ancestor_Storybook.addArgTypes(
  basicUsage,
  {
    "variant": {
      "options": ["primary"],
      "control": {"type": "radio"},
    },
  },
)
