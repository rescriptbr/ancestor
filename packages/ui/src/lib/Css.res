include AncestorCss.Make(
  {
    type spacing = AncestorCss_Types.Length.t
    let spacing = v => v
  },
  {
    type radius = AncestorCss_Types.Length.t
    let radius = v => v
  },
  {
    type colors = AncestorCss_Types.Color.t
    let colors = v => v
  },
  {
    type zIndex = int
    let zIndex = v => v
  },
  AncestorCss_Parsers.Simple,
)
