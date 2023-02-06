let useClasses = () => {
  let {css} = Theme.useCss()

  let baseStyles = css({
    color: #primary,
    borderStyle: #none,
  })

  `${baseStyles}`
}

@react.component
let make = () => {
  let className = useClasses()

  <button className />
}
