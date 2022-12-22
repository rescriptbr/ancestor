module Tokens = AncestorUI_ButtonTokens

module Make = (Config: AncestorUI_Theme.T) => {
  let theme = switch Config.theme.button {
  | None => Tokens.defaults
  | Some(custom) => custom
  }

  @react.component
  let make = (~size: Tokens.size) => {
    let styles = theme.sizes(size)
    <div />
  }
}
