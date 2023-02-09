type size = [#xs | #sm | #md | #lg]
type color = [#primary | #secondary]

type defaults = {
  size?: size,
  colors?: color,
}

type api = {
  baseStyles?: array<CssJs.rule>,
  size?: size => array<CssJs.rule>,
  color?: color => array<CssJs.rule>,
  defaults?: defaults,
}
