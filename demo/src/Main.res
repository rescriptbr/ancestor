let root = ReactDOM.querySelector("#root")

let () = switch root {
| Some(element) => ReactDOM.render(<App />, element)
| None => Js.log("Roout element not found")
}
