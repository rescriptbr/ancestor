module Create = (Config: Ancestor_Config.T) => {
  module Core = AncestorCore.Make(Config)
  let useTest = () => {
    let theme = Core.Styles.Css.Context.useContext()
    theme.colors(#primary)
  }
}
