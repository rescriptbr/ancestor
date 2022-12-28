let default = Storybook.story(~title="Button", ~excludeStories=["CustomUI", "theme"], ())

module CustomUI = {
  include AncestorUI.Make({
    type spacing = float
    let spacing = v => #pxFloat(v *. 8.0)
  })
}

let theme: CustomUI.Theme.theme = {
  button: {
    baseStyles: {
      bgColor: #primary400,
    },
  },
}

let overview = () => {
  <CustomUI.ThemeProvider value=theme>
    <CustomUI.Button> {"Click here"->React.string} </CustomUI.Button>
  </CustomUI.ThemeProvider>
}
