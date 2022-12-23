module Make = (Config: Theme.CustomTheme) => {
  module ThemeConstructor = {
    type spacing = Config.spacing
    let theme = Theme.mergeWithDefaults(Config.theme)
  }
  /*
   *  Mappers
   */
  let colors = token =>
    switch Config.theme.colors {
    | None => Theme.default.colors(token)
    | Some(colors) => colors(token)
    }

  /*
   * Components
   */
  module Button = Button.Make(ThemeConstructor)
}

include Make({
  let theme: Theme.custom = {}
})
