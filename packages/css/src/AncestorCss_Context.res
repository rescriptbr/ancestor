module Make = (Parser: AncestorCss_Parsers.Config, TokensConfig: AncestorCss_Types.Config) => {
  module Types = AncestorCss_Types.Make(TokensConfig)

  type api = {
    colors: TokensConfig.colors => Types.Color.t,
    spacing: TokensConfig.spacing => Types.Length.t,
    radius: TokensConfig.radius => Types.Length.t,
    zIndex: TokensConfig.zIndex => int,
  }

  type partialApi = {
    colors?: TokensConfig.colors => Types.Color.t,
    spacing?: TokensConfig.spacing => Types.Length.t,
    radius?: TokensConfig.radius => Types.Length.t,
    zIndex?: TokensConfig.zIndex => int,
  }

  let contextValue: api = {
    colors: TokensConfig.colors,
    spacing: TokensConfig.spacing,
    radius: TokensConfig.radius,
    zIndex: TokensConfig.zIndex,
  }

  let context = React.createContext(contextValue)

  module Internal__Provider = {
    let make = React.Context.provider(context)
  }

  module Provider = {
    @react.component
    let make = (~children, ~value: partialApi) => {
      let apiValue: api = {
        colors: value.colors->Belt.Option.getWithDefault(TokensConfig.colors),
        spacing: value.spacing->Belt.Option.getWithDefault(TokensConfig.spacing),
        radius: value.radius->Belt.Option.getWithDefault(TokensConfig.radius),
        zIndex: value.zIndex->Belt.Option.getWithDefault(TokensConfig.zIndex),
      }

      <Internal__Provider value=apiValue> children </Internal__Provider>
    }
  }

  let useContext = () => React.useContext(context)
}
