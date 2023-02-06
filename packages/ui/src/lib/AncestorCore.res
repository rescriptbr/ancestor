module Make = (Config: Ancestor_Config.T) => {
  include Ancestor.Make(
    {
      type breakpoints<'value> = Config.breakpoints<'value>
      type keyOfBreakpoints = Config.keyOfBreakpoints
      let encode = Config.encode
      let sizeByBreakpoints = Config.sizeByBreakpoints
    },
    Theme.Colors,
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
