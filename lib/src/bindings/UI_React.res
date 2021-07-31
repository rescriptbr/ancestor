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
external createElement: (tags, {..}) => React.element = "createElement"
