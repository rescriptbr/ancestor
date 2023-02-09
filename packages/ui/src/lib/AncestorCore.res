module Make = (Config: Theme.Config) => {
  include Ancestor.Make(
    {
      type breakpoints<'value> = Config.breakpoints<'value>
      type keyOfBreakpoints = Config.keyOfBreakpoints
      let encode = Config.encode
      let sizeByBreakpoints = Config.sizeByBreakpoints
    },
    {
      type colors = Theme.Colors.colors<Config.colors>
      let colors = Config.colors
    },
    {
      type spacing = Config.spacing
      let spacing = Config.spacing
    },
    {
      type radius = Config.radius
      let radius = Config.radius
    },
    {
      type zIndex = Config.zIndex
      let zIndex = Config.zIndex
    },
  )
}
