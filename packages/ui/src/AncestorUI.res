module Make = (BreakpointsConfig: Ancestor_Config.Breakpoints) => {
  module Config = {
    include BreakpointsConfig
    include Theme.Colors
    include Ancestor.Defaults.Spacing
    include Ancestor.Defaults.Radius
    include Ancestor.Defaults.ZIndex
  }

  module Core = AncestorCore.Make(Config)

  module Theme = {
    let useTheme = (): Theme.theme => {
      let theme = Core.Styles.Css.Context.useContext()

      {colors: theme.colors}
    }
  }
}
