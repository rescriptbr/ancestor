module LineHeight = {
  type t = [
    | #ch(float)
    | #em(float)
    | #ex(float)
    | #rem(float)
    | #vh(float)
    | #vw(float)
    | #vmin(float)
    | #vmax(float)
    | #px(int)
    | #pxFloat(float)
    | #cm(float)
    | #mm(float)
    | #inch(float)
    | #pc(float)
    | #pt(int)
    | #zero
    | #calc([#add | #sub | #mult], Css_AtomicTypes.Length.t, Css_AtomicTypes.Length.t)
    | #percent(float)
    | #var(string)
    | #varDefault(string, string)
    | #normal
    | #abs(float)
    | #initial
    | #inherit_
    | #unset
  ]

  let toRule: t => CssJs.rule = CssJs.lineHeight
}

module FontFamily = {
  type t = [
    | #custom(string)
    | #serif
    | #sansSerif
    | #cursive
    | #fantasy
    | #monospace
    | #systemUi
    | #emoji
    | #math
    | #fangsong
    | #var(string)
    | #varDefault(string, string)
    | #initial
    | #inherit_
    | #unset
  ]

  let toRule: t => CssJs.rule = CssJs.fontFamily
}

module Color = {
  open Css_AtomicTypes
  type t = [
    | #rgb(int, int, int)
    | #rgba(int, int, int, [#num(float) | Percentage.t])
    | #hsl(Angle.t, Percentage.t, Percentage.t)
    | #hsla(Angle.t, Percentage.t, Percentage.t, [#num(float) | Percentage.t])
    | #hex(string)
    | #transparent
    | #currentColor
    | #var(string)
    | #varDefault(string, string)
  ]

  let toRule: t => CssJs.rule = CssJs.color
}
