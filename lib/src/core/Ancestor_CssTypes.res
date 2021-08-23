module Color = {
  type t = [
    | #rgb(int, int, int)
    | #hex(string)
    | #transparent
    | #currentColor
  ]

  let toString = (color: t) =>
    switch color {
    | #rgb(r, g, b) => `rgb(${r->Js.Int.toString}, ${g->Js.Int.toString}, ${b->Js.Int.toString})`
    | #hex(hexColor) => hexColor
    | #transparent => "transparent"
    | #currentColor => "currentColor"
    }
}

module Length = {
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
    | #pct(float)
  ]

  let toString = (x: t) =>
    switch x {
    | #ch(x) => Js.Float.toString(x) ++ "ch"
    | #em(x) => Js.Float.toString(x) ++ "em"
    | #ex(x) => Js.Float.toString(x) ++ "ex"
    | #rem(x) => Js.Float.toString(x) ++ "rem"
    | #vh(x) => Js.Float.toString(x) ++ "vh"
    | #vw(x) => Js.Float.toString(x) ++ "vw"
    | #vmin(x) => Js.Float.toString(x) ++ "vmin"
    | #vmax(x) => Js.Float.toString(x) ++ "vmax"
    | #px(x) => Js.Int.toString(x) ++ "px"
    | #pxFloat(x) => Js.Float.toString(x) ++ "px"
    | #cm(x) => Js.Float.toString(x) ++ "cm"
    | #mm(x) => Js.Float.toString(x) ++ "mm"
    | #inch(x) => Js.Float.toString(x) ++ "in"
    | #pc(x) => Js.Float.toString(x) ++ "pc"
    | #pt(x) => Js.Int.toString(x) ++ "pt"
    | #zero => "0"
    | #pct(x) => Js.Float.toString(x) ++ "%"
    }
}

module Display = {
  type t = [
    | #none
    | #inline
    | #block
    | #"list-item"
    | #"inline-block"
    | #"inline-table"
    | #table
    | #"table-cell"
    | #"table-column"
    | #"table-column-group"
    | #"table-footer-group"
    | #"table-header-group"
    | #"table-row"
    | #"table-row-group"
    | #flex
    | #"inline-flex"
    | #grid
    | #"inline-grid"
    | #"run-in"
    | #inherit
  ]

  let toString = Obj.magic
}

module JustifyContent = {
  type t = [
    | #initial
    | #"space-between"
    | #center
    | #"flex-start"
    | #"flex-end"
    | #"space-around"
    | #"space-evenly"
    | #start
    | #end
    | #left
    | #right
    | #revert
    | #unset
  ]
  let toString = Obj.magic
}

module AlignItems = {
  type t = [
    | #initial
    | #center
    | #start
    | #end
    | #"flex-start"
    | #"flex-end"
    | #"self-start"
    | #"self-end"
  ]

  let toString = Obj.magic
}

module FlexDirection = {
  type t = [
    | #row
    | #"row-reverse"
    | #column
    | #"column-reverse"
    | #inherit
    | #initial
    | #unset
  ]

  let toString = Obj.magic
}

module FlexWrap = {
  type t = [
    | #nowrap
    | #wrap
    | #"wrap-reverse"
    | #inherit
    | #initial
    | #unset
  ]

  let toString = Obj.magic
}

module FlexBasis = {
  type t = [
    | #length(Length.t)
    | #auto
    | #fill
    | #content
    | #"max-content"
    | #"min-content"
    | #"fit-content"
  ]

  let toString = (value: t) =>
    switch value {
    | #length(value) => Length.toString(value)
    | value => Obj.magic(value)
    }
}

module FlexGrow = {
  type t = [
    | #num(float)
    | #inherit
    | #initial
    | #revert
    | #unset
  ]

  let toString = (value: t) =>
    switch value {
    | #num(growValue) => growValue->Js.Float.toString
    | growValue => Obj.magic(growValue)
    }
}

module AlignContent = {
  type t = [
    | #center
    | #start
    | #end
    | #"flex-end"
    | #normal
    | #baseline
    | #"first-baseline"
    | #"last-baseline"
    | #"space-between"
    | #"space-around"
    | #"space-evenly"
    | #stretch
    | #"safe-center"
    | #"unsafe-center"
    | #inherit
    | #initial
    | #unset
    | #"flex-start"
  ]

  let toString = (value: t) =>
    switch value {
    | #"first-baseline" => "first baseline"
    | #"last-baseline" => "last baseline"
    | #"safe-center" => "safe center"
    | #"unsafe-center" => "unsafe center"
    | value => (value :> string)
    }
}

module AlignSelf = AlignContent

module JustifySelf = AlignContent

module FlexFlow = {
  type t = (FlexDirection.t, FlexWrap.t)

  let toString = ((direction, wrap): t) => `${(direction :> string)} ${(wrap :> string)}`
}

module Position = {
  type t = [
    | #static
    | #relative
    | #absolute
    | #fixed
    | #sticky
  ]
  let toString = Obj.magic
}

module TextAlign = {
  type t = [#center | #left | #right]

  let toString = Obj.magic
}

module FontWeight = {
  type t = [
    | #normal
    | #bold
    | #bolder
    | #lighter
    | #100
    | #200
    | #300
    | #400
    | #500
    | #600
    | #700
    | #800
    | #900
    | #initial
    | #inherit
  ]

  let toString = Obj.magic
}

module BoxSizing = {
  type t = [
    | #"content-box"
    | #"border-box"
    | #initial
    | #inherit
  ]

  let toString = Obj.magic
}

module ZIndex = {
  type t = int

  let toString = Js.Int.toString
}

module Border = {
  type style = [
    | #none
    | #hidden
    | #dotted
    | #dashed
    | #solid
    | #double
    | #groove
    | #ridge
    | #inset
    | #outset
  ]

  type t = (Length.t, style, Color.t)

  let toString = ((width, style, color): t) =>
    `${Length.toString(width)} ${(style :> string)} ${Color.toString(color)}`
}
