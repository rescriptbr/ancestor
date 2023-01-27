let baseStyles = AncestorCss.css({
  display: #flex,
})

@react.component
let make = (~children) => {
  <button className={`${baseStyles}`}> {children} </button>
}
