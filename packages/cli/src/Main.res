open Ink

module App = {
  @react.component
  let make = () => {
    React.useEffect0(() => {
      ConfigParser.getConfig()

      None
    })

    <Text color=#green> {"Testing..."->React.string} </Text>
  }
}

let {waitUntilExit} = render(<App />, ~exitOnCtrlC=true, ())
waitUntilExit()->ignore
