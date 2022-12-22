let default = Ancestor_Storybook.story(~title="Test", ~excludeStories=["UI"], ())

module UI = AncestorUI.Make({
  open! AncestorUI_Theme

  let theme = {
    colors: color =>
      switch color {
      | #primary100 => #hex("#ccc")
      },
  }
})

let basicUsage = () => <UI.Button size=#lg />
