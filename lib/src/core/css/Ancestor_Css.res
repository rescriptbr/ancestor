/*
 *  CSS units (width, height, font-size, etc)
 */
module Length = {
  type operator = [#sub | #add | #mult | #div]

  type rec t = [
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
    | #add(t, t)
    | #sub(t, t)
    | #div(t, t)
    | #mult(t, t)
  ]

  let rec toString = (x: t) =>
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
    | #add(v1, v2) => `calc(${v1->toString} + ${v2->toString})`
    | #sub(v1, v2) => `calc(${v1->toString} - ${v2->toString})`
    | #mult(v1, v2) => `calc(${v1->toString} * ${v2->toString})`
    | #div(v1, v2) => `calc(${v1->toString} / ${v2->toString})`
    }
}

module Make = (
  Config: {
    type spacing
    let spacing: spacing => Length.t
  },
) => {
  /*
   * color (color, background, etc)
   */
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

  module Length = Length

  module TextTransform = {
    type t = [#none | #capitalize | #uppercase | #lowercase]

    let toString = value =>
      switch value {
      | #none => "none"
      | #capitalize => "capitalize"
      | #uppercase => "uppercase"
      | #lowercase => "lowercase"
      }
  }

  /*
   * text-decoration(style, line, color)
   */
  module TextDecorationStyle = {
    type t = [#none | #solid | #double | #dotted | #dashed | #wavy]

    let toString = (textDecorationStyle: t) => (textDecorationStyle :> string)
  }

  module TextDecorationLine = {
    type t = [#none | #underline | #overline | #"line-through" | #blink]

    let toString = value =>
      switch value {
      | #none => "none"
      | #underline => "underline"
      | #overline => "overline"
      | #"line-through" => "line-through"
      | #blink => "blink"
      }
  }

  module TextDecoration = {
    type t = [
      | #short(TextDecorationLine.t, Color.t, TextDecorationStyle.t)
      | #initial
      | #inherit
      | #none
    ]

    let toString = (textDecoration: t) =>
      switch textDecoration {
      | #short(line, color, style) =>
        `${line->TextDecorationLine.toString} ${color->Color.toString} ${style->TextDecorationStyle.toString}`
      | #initial => "initial"
      | #inherit => "inherit"
      | #none => "none"
      }
  }
  /*
   * outline(style)
   */
  module OutlineStyle = {
    type t = [
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

    let toString = (outlineStyle: t) => (outlineStyle :> string)
  }

  module Outline = {
    type t = [
      | #short(Length.t, OutlineStyle.t, Color.t)
      | #inherit
      | #initial
      | #unset
    ]

    let toString = (outline: t) =>
      switch outline {
      | #short(length, style, color) =>
        `${length->Length.toString} ${style->OutlineStyle.toString} ${color->Color.toString}`
      | #inherit => "inherit"
      | #initial => "initial"
      | #unset => "unset"
      }
  }

  /*
   * list-style(type, image, position)
   */
  module ListStyleType = {
    type t = [
      | #disc
      | #circle
      | #square
      | #decimal
      | #"lower-alpha"
      | #"upper-alpha"
      | #"lower-greek"
      | #"lower-latin"
      | #"upper-latin"
      | #"lower-roman"
      | #"upper-roman"
      | #none
    ]

    let toString = (listStyleType: t) => (listStyleType :> string)
  }

  module ListStylePosition = {
    type t = [#inside | #outside]
    let toString = (position: t) => (position :> string)
  }

  module ListStyleImage = {
    type t = [#none | #url(string)]

    let toString = (image: t) =>
      switch image {
      | #none => "none"
      | #url(url) => `url("${url}")`
      }
  }

  module ListStyle = {
    type t = [
      | #"type"(ListStyleType.t)
      | #position(ListStylePosition.t)
      | #image(ListStyleImage.t)
      | #short(ListStyleType.t, ListStylePosition.t, ListStyleImage.t)
      | #inherit
      | #initial
      | #revert
      | #unset
      | #none
    ]

    let toString = (listStyle: t) =>
      switch listStyle {
      | #"type"(value) => value->ListStyleType.toString
      | #position(value) => value->ListStylePosition.toString
      | #image(value) => value->ListStyleImage.toString
      | #short(type_, position, image) =>
        `${type_->ListStyleType.toString} ${position->ListStylePosition.toString} ${image->ListStyleImage.toString}`
      | #inherit => "inherit"
      | #initial => "initial"
      | #revert => "revert"
      | #unset => "unset"
      | #none => "none"
      }
  }

  module Overflow = {
    type t = [#hidden | #visible | #scroll | #auto]

    let toString = (overflow: t) => (overflow :> string)
  }

  module Cursor = {
    type t = [
      | #auto
      | #default
      | #none
      | #"context-menu"
      | #help
      | #pointer
      | #progress
      | #wait
      | #cell
      | #crosshair
      | #text
      | #"vertical-text"
      | #alias
      | #copy
      | #move
      | #"no-drop"
      | #"not-allowed"
      | #grab
      | #grabbing
      | #"all-scroll"
      | #"col-resize"
      | #"row-resize"
      | #"n-resize"
      | #"e-resize"
      | #"s-resize"
      | #"w-resize"
      | #"ne-resize"
      | #"nw-resize"
      | #"se-resize"
      | #"sw-resize"
      | #"ew-resize"
      | #"ns-resize"
      | #"nesw-resize"
      | #"nwse-resize"
      | #"zoom-in"
      | #"zoom-out"
    ]

    let toString = (cursor: t) => (cursor :> string)
  }

  module Visibility = {
    type t = [#visible | #hidden | #collapse]

    let toString = (visibility: t) => (visibility :> string)
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

  module Gap = {
    type t = [
      | #one(Config.spacing)
      | #two(Config.spacing, Config.spacing)
      | #inherit
      | #initial
      | #revert
      | #unset
    ]

    let toString = (gap: t) => {
      let spacingToString = v => v->Config.spacing->Length.toString
      switch gap {
      | #one(v) => v->spacingToString
      | #two(v1, v2) => `${v1->spacingToString} ${v2->spacingToString}`
      | #inherit => "inherit"
      | #initial => "initial"
      | #revert => "revert"
      | #unset => "unset"
      }
    }
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

  module BorderStyle = {
    type t = [
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

    let toString = (v: t) => (v :> string)
  }

  module Border = {
    type t = (Length.t, BorderStyle.t, Color.t)

    let toString = ((width, style, color): t) =>
      `${Length.toString(width)} ${BorderStyle.toString(style)} ${Color.toString(color)}`
  }

  module Angle = {
    type t = [#deg(float) | #rad(float) | #grad(float) | #turn(float)]

    let toString = x =>
      switch x {
      | #deg(x) => `${Js.Float.toString(x)}deg`
      | #rad(x) => `${Js.Float.toString(x)}rad`
      | #grad(x) => `${Js.Float.toString(x)}grad`
      | #turn(x) => `${Js.Float.toString(x)}turn`
      }
  }

  module Transform = {
    type t = [
      | #translate(Length.t, Length.t)
      | #translate3d(Length.t, Length.t, Length.t)
      | #translateX(Length.t)
      | #translateY(Length.t)
      | #translateZ(Length.t)
      | #scale(float, float)
      | #scale3d(float, float, float)
      | #scaleX(float)
      | #scaleY(float)
      | #scaleZ(float)
      | #rotate(Angle.t)
      | #rotate3d(float, float, float, Angle.t)
      | #rotateX(Angle.t)
      | #rotateY(Angle.t)
      | #rotateZ(Angle.t)
      | #skew(Angle.t, Angle.t)
      | #skewX(Angle.t)
      | #skewY(Angle.t)
      | #perspective(int)
    ]

    let string_of_scale = (x, y) => `scale(${Js.Float.toString(x)}, ${Js.Float.toString(y)})`

    let string_of_translate3d = (x, y, z) =>
      `translate3d(${Length.toString(x)}, ${Length.toString(y)}, ${Length.toString(z)})`

    let toString = x =>
      switch x {
      | #translate(x, y) => `translate(${Length.toString(x)}, ${Length.toString(y)})`
      | #translate3d(x, y, z) => string_of_translate3d(x, y, z)
      | #translateX(x) => `translateX(${Length.toString(x)})`
      | #translateY(y) => `translateY(${Length.toString(y)})`
      | #translateZ(z) => `translateZ(${Length.toString(z)})`
      | #scale(x, y) => string_of_scale(x, y)
      | #scale3d(x, y, z) =>
        `scale3d(${Js.Float.toString(x)}, ${Js.Float.toString(y)}, ${Js.Float.toString(z)})`
      | #scaleX(x) => `scaleX(${Js.Float.toString(x)})`
      | #scaleY(y) => `scaleY(${Js.Float.toString(y)})`
      | #scaleZ(z) => `scaleZ(${Js.Float.toString(z)}`
      | #rotate(a) => `rotate(${Angle.toString(a)})`
      | #rotate3d(x, y, z, a) =>
        `rotate3d(${Js.Float.toString(x)}, ${Js.Float.toString(y)}, ${Js.Float.toString(
            z,
          )}, ${Angle.toString(a)})`

      | #rotateX(a) => `rotateX(${Angle.toString(a)})`
      | #rotateY(a) => `rotateY(${Angle.toString(a)})`
      | #rotateZ(a) => `rotateZ(${Angle.toString(a)})`
      | #skew(x, y) => `skew(${Angle.toString(x)}, ${Angle.toString(y)})`
      | #skewX(a) => `skewX(${Angle.toString(a)})`
      | #skewY(a) => `skewY(${Angle.toString(a)})`
      | #perspective(x) => `perspective(${Js.Int.toString(x)})`
      }
  }

  /*
   * background(color, size, position)
   */
  module BackgroundSize = {
    type t = [
      | #size
      | #contain
      | #inherit
      | #initial
      | #unset
      | #auto
      | #length(Length.t)
    ]

    let toString = (bgSize: t) =>
      switch bgSize {
      | #size => "size"
      | #contain => "contain"
      | #inherit => "inherit"
      | #initial => "initial"
      | #unset => "unset"
      | #auto => "auto"
      | #length(value) => value->Length.toString
      }
  }

  module BackgroundPosition = {
    type t = [
      | #top
      | #bottom
      | #left
      | #right
      | #center
      | #inherit
      | #initial
      | #unset
      | #length(Length.t)
    ]

    let toString = (bgPosition: t) =>
      switch bgPosition {
      | #top => "top"
      | #bottom => "bottom"
      | #left => "left"
      | #right => "right"
      | #center => "center"
      | #inherit => "inherit"
      | #initial => "initial"
      | #unset => "unset"
      | #length(value) => value->Length.toString
      }
  }

  module BackgroundImage = {
    type t = [#url(string)]

    let toString = (bgImage: t) =>
      switch bgImage {
      | #url(url) => `url("${url}")`
      }
  }
}
