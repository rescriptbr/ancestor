open UI_Core

let flex = Goober.css(`
  width: 100%;
  flex-wrap: wrap;
`)

let make = UI_Base.make

let makeProps = (~className as customClass: string="") =>
  UI_Base.makeProps(~display=[xxs(#flex)], ~className=`${flex} ${customClass}`)
