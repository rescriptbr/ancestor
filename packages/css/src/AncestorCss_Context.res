module Make = (Parser: AncestorCss_Parsers.Config, TokensConfig: AncestorCss_Types.Config) => {
  module Types = AncestorCss_Types.Make(TokensConfig)

  type api = {
    colors: TokensConfig.colors => Types.Color.t,
    spacing: TokensConfig.spacing => Types.Length.t,
    radius: TokensConfig.radius => Types.Length.t,
    zIndex: TokensConfig.zIndex => int,
  }

  let context = React.createContext({
    colors: TokensConfig.colors,
    spacing: TokensConfig.spacing,
    radius: TokensConfig.radius,
    zIndex: TokensConfig.zIndex,
  })

  module Provider = {
    let make = React.Context.provider(context)
  }

  let useContext = () => React.useContext(context)
}
