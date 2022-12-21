let story = (~title, ~component=?, ~argTypes=?, ~excludeStories=[], ()) => {
  let ignoredStories = switch excludeStories {
  | [] => "default"
  | stories => "default|"->Js.String2.concat(stories->Js.Array2.joinWith("|"))
  }

  {
    "title": title,
    "excludeStories": Js.Re.fromString(ignoredStories),
    "component": component,
    "argTypes": argTypes,
  }
}

@module("./storybook.js") external addArgTypes: ('props => React.element, {..}) => unit = "default"
