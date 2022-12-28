let default = Storybook.story(
  ~title="Main",
  ~excludeStories=["CustomCss", "dark", "light", "ProviderTest"],
  (),
)

let main = () => {
  let styles = AncestorCss.toCss({
    display: #flex,
    bgColor: #hex("#000"),
    p: #px(32),
    color: #hex("#fafafa"),
    fontSize: #px(24),
  })

  <div className={styles->Emotion.rawCss}> {"Hey :)"->React.string} </div>
}

module CustomCss = {
  open AncestorCss.Defaults
  module CustomColors = {
    type colors = [#primary | #secondary]

    let colors = token =>
      switch token {
      | #primary => #hex("#000")
      | #secondary => #hex("#ccc")
      }
  }

  include AncestorCss.Make(Spacing, Radius, CustomColors, ZIndex, AncestorCss_Parsers.Simple)
}

let dark = {
  open CustomCss.Context
  open AncestorCss.Defaults

  {
    colors: token =>
      switch token {
      | #primary => #hex("#000")
      | #secondary => #hex("#ccc")
      },
    spacing: Spacing.spacing,
    radius: Radius.radius,
    zIndex: ZIndex.zIndex,
  }
}

let light = {
  open CustomCss.Context
  open AncestorCss.Defaults

  {
    colors: token =>
      switch token {
      | #primary => #hex("#fafafa")
      | #secondary => #hex("#000")
      },
    spacing: Spacing.spacing,
    radius: Radius.radius,
    zIndex: ZIndex.zIndex,
  }
}

module ProviderTest = {
  @react.component
  let make = () => {
    let theme = CustomCss.useCss()
    let styles = theme.toCss({
      display: #flex,
      bgColor: #primary,
      p: #px(32),
      color: #secondary,
      fontSize: #px(24),
      mt: #px(32),
    })

    <div className={styles->Emotion.rawCss}> {"Hey :)"->React.string} </div>
  }
}

let customSetup = () => {
  let (theme, setTheme) = React.useState(_ => dark)

  <CustomCss.Provider value=theme>
    <button onClick={_ => setTheme(_ => light)}> {"Toggle theme"->React.string} </button>
    <ProviderTest />
  </CustomCss.Provider>
}
