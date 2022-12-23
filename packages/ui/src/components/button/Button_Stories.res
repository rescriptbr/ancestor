let default = Storybook.story(~title="Button", ~excludeStories=["CustomUI"], ())

let overview = () => {
  <div>
    <AncestorUI.Button size=#lg> {"Click here"->React.string} </AncestorUI.Button>
    <hr />
    <AncestorUI.Button size=#md> {"Click here"->React.string} </AncestorUI.Button>
    <hr />
    <AncestorUI.Button size=#sm> {"Click here"->React.string} </AncestorUI.Button>
  </div>
}

module CustomUI = AncestorUI.Make({
  let theme: Theme.custom = {
    button: {
      lg: {
        height: #px(32),
        fontSize: #rem(2.4),
      },
    },
  }
})

let custom = () => {
  <div>
    <CustomUI.Button size=#lg> {"Click here"->React.string} </CustomUI.Button>
    <hr />
    <CustomUI.Button size=#md> {"Click here"->React.string} </CustomUI.Button>
    <hr />
    <CustomUI.Button size=#sm> {"Click here"->React.string} </CustomUI.Button>
  </div>
}
