type tags = [
  | #header
  | #div
  | #section
  | #ul
  | #li
  | #span
  | #footer
]

@module("react")
external createElement: (tags, ReactDOM.domProps, React.element) => React.element = "createElement"
