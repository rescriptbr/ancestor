/* open Ancestor_Core

let flex = Ancestor_Emotion.css(`
  width: 100%;
  flex-wrap: wrap;
`)

let make = Ancestor_Base.make

let makeProps = (~className as customClass: string="") =>
  Ancestor_Base.makeProps(~display=[#xxs(#flex)], ~className=`${flex} ${customClass}`)
 */
