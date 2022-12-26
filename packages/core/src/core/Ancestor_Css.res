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

module type Config = {
  type spacing
  let spacing: spacing => Length.t

  type colors
  let colors: colors => Color.t

  type radius
  let radius: radius => Length.t

  type zIndex
  let zIndex: zIndex => int

  type propsWrapper<'a>
  let propsTransformer: (string, option<propsWrapper<'a>>, 'a => string) => string
}

module Make = (Config: Config) => {
  module Length = Length
  module Color = Color

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
      | #short(TextDecorationLine.t, Config.colors, TextDecorationStyle.t)
      | #initial
      | #inherit
      | #none
    ]

    let toString = (textDecoration: t) =>
      switch textDecoration {
      | #short(line, color, style) =>
        `${line->TextDecorationLine.toString} ${color
          ->Config.colors
          ->Color.toString} ${style->TextDecorationStyle.toString}`
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
      | #short(Length.t, OutlineStyle.t, Config.colors)
      | #inherit
      | #initial
      | #unset
    ]

    let toString = (outline: t) =>
      switch outline {
      | #short(length, style, color) =>
        `${length->Length.toString} ${style->OutlineStyle.toString} ${color
          ->Config.colors
          ->Color.toString}`
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

  module FontFamily = {
    type t = [#custom(array<string>) | #initial | #inherit]

    let toString = (v: t) =>
      switch v {
      | #custom(families) => families->Js.Array2.joinWith(", ")
      | #initial => "initial"
      | #inherit => "inherit"
      }
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
    type t = Config.zIndex

    let toString = v => v->Config.zIndex->Js.Int.toString
  }

  module Radius = {
    type t = Config.radius

    let toString = v => v->Config.radius->Length.toString
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
    type t = (Length.t, BorderStyle.t, Config.colors)

    let toString = ((width, style, color): t) =>
      `${Length.toString(width)} ${BorderStyle.toString(style)} ${color
        ->Config.colors
        ->Color.toString}`
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
      | #cover
      | #contain
      | #inherit
      | #initial
      | #unset
      | #auto
      | #length(Length.t)
    ]

    let toString = (bgSize: t) =>
      switch bgSize {
      | #cover => "cover"
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
    type t = [#url(string) | #none]

    let toString = (bgImage: t) =>
      switch bgImage {
      | #url(url) => `url("${url}")`
      | #none => "none"
      }
  }

  type rec properties = {
    borderRadius?: Config.propsWrapper<Config.radius>,
    borderTLRadius?: Config.propsWrapper<Config.radius>,
    borderTRRadius?: Config.propsWrapper<Config.radius>,
    borderBLRadius?: Config.propsWrapper<Config.radius>,
    borderBRRadius?: Config.propsWrapper<Config.radius>,
    borderStyle?: Config.propsWrapper<BorderStyle.t>,
    borderColor?: Config.propsWrapper<Config.colors>,
    borderWidth?: Config.propsWrapper<Length.t>,
    border?: Config.propsWrapper<Border.t>,
    borderRight?: Config.propsWrapper<Border.t>,
    borderLeft?: Config.propsWrapper<Border.t>,
    borderTop?: Config.propsWrapper<Border.t>,
    borderBottom?: Config.propsWrapper<Border.t>,
    borderRightStyle?: Config.propsWrapper<BorderStyle.t>,
    borderLeftStyle?: Config.propsWrapper<BorderStyle.t>,
    borderTopStyle?: Config.propsWrapper<BorderStyle.t>,
    borderBottomStyle?: Config.propsWrapper<BorderStyle.t>,
    borderRightColor?: Config.propsWrapper<Config.colors>,
    borderLeftColor?: Config.propsWrapper<Config.colors>,
    borderTopColor?: Config.propsWrapper<Config.colors>,
    borderBottomColor?: Config.propsWrapper<Config.colors>,
    borderRightWidth?: Config.propsWrapper<Length.t>,
    borderLeftWidth?: Config.propsWrapper<Length.t>,
    borderTopWidth?: Config.propsWrapper<Length.t>,
    borderBottomWidth?: Config.propsWrapper<Length.t>,
    bgColor?: Config.propsWrapper<Config.colors>,
    bgSize?: Config.propsWrapper<BackgroundSize.t>,
    bgPosition?: Config.propsWrapper<BackgroundPosition.t>,
    bgImage?: Config.propsWrapper<BackgroundImage.t>,
    color?: Config.propsWrapper<Config.colors>,
    display?: Config.propsWrapper<Display.t>,
    justifyContent?: Config.propsWrapper<JustifyContent.t>,
    flexDirection?: Config.propsWrapper<FlexDirection.t>,
    alignItems?: Config.propsWrapper<AlignItems.t>,
    flexBasis?: Config.propsWrapper<FlexBasis.t>,
    flexWrap?: Config.propsWrapper<FlexWrap.t>,
    flexGrow?: Config.propsWrapper<FlexGrow.t>,
    alignContent?: Config.propsWrapper<AlignContent.t>,
    alignSelf?: Config.propsWrapper<AlignSelf.t>,
    justifySelf?: Config.propsWrapper<JustifySelf.t>,
    flexFlow?: Config.propsWrapper<FlexFlow.t>,
    gap?: Config.propsWrapper<Gap.t>,
    p?: Config.propsWrapper<Config.spacing>,
    px?: Config.propsWrapper<Config.spacing>,
    py?: Config.propsWrapper<Config.spacing>,
    pt?: Config.propsWrapper<Config.spacing>,
    pb?: Config.propsWrapper<Config.spacing>,
    pl?: Config.propsWrapper<Config.spacing>,
    pr?: Config.propsWrapper<Config.spacing>,
    m?: Config.propsWrapper<Config.spacing>,
    mx?: Config.propsWrapper<Config.spacing>,
    my?: Config.propsWrapper<Config.spacing>,
    mt?: Config.propsWrapper<Config.spacing>,
    mb?: Config.propsWrapper<Config.spacing>,
    ml?: Config.propsWrapper<Config.spacing>,
    mr?: Config.propsWrapper<Config.spacing>,
    textAlign?: Config.propsWrapper<TextAlign.t>,
    fontFamily?: Config.propsWrapper<FontFamily.t>,
    fontWeight?: Config.propsWrapper<FontWeight.t>,
    fontSize?: Config.propsWrapper<Length.t>,
    letterSpacing?: Config.propsWrapper<Length.t>,
    lineHeight?: Config.propsWrapper<Length.t>,
    width?: Config.propsWrapper<Length.t>,
    height?: Config.propsWrapper<Length.t>,
    minW?: Config.propsWrapper<Length.t>,
    minH?: Config.propsWrapper<Length.t>,
    maxW?: Config.propsWrapper<Length.t>,
    maxH?: Config.propsWrapper<Length.t>,
    position?: Config.propsWrapper<Position.t>,
    top?: Config.propsWrapper<Length.t>,
    bottom?: Config.propsWrapper<Length.t>,
    left?: Config.propsWrapper<Length.t>,
    right?: Config.propsWrapper<Length.t>,
    zIndex?: Config.propsWrapper<ZIndex.t>,
    boxSizing?: Config.propsWrapper<BoxSizing.t>,
    overflow?: Config.propsWrapper<Overflow.t>,
    overflowX?: Config.propsWrapper<Overflow.t>,
    overflowY?: Config.propsWrapper<Overflow.t>,
    cursor?: Config.propsWrapper<Cursor.t>,
    visibility?: Config.propsWrapper<Visibility.t>,
    listStyleType?: Config.propsWrapper<ListStyleType.t>,
    listStylePosition?: Config.propsWrapper<ListStylePosition.t>,
    listStyleImage?: Config.propsWrapper<ListStyleImage.t>,
    listStyle?: Config.propsWrapper<ListStyle.t>,
    outlineStyle?: Config.propsWrapper<OutlineStyle.t>,
    outline?: Config.propsWrapper<Outline.t>,
    textDecorationStyle?: Config.propsWrapper<TextDecorationStyle.t>,
    textDecorationLine?: Config.propsWrapper<TextDecorationLine.t>,
    textDecoration?: Config.propsWrapper<TextDecoration.t>,
    transform?: Config.propsWrapper<Transform.t>,
    /*
     * Pseudo
     */
    _hover?: Config.propsWrapper<properties>,
    _focus?: Config.propsWrapper<properties>,
    _active?: Config.propsWrapper<properties>,
    _focusWithin?: Config.propsWrapper<properties>,
    _focusVisible?: Config.propsWrapper<properties>,
    _disabled?: Config.propsWrapper<properties>,
    _before?: Config.propsWrapper<properties>,
    _after?: Config.propsWrapper<properties>,
    _even?: Config.propsWrapper<properties>,
    _odd?: Config.propsWrapper<properties>,
    _first?: Config.propsWrapper<properties>,
    _last?: Config.propsWrapper<properties>,
    _notFirst?: Config.propsWrapper<properties>,
    _notLast?: Config.propsWrapper<properties>,
  }

  let propertiesToString = (styles: properties) => {
    let s = Config.propsTransformer

    let spacing = v => v->Config.spacing->Length.toString
    let colors = v => v->Config.colors->Color.toString

    [
      s("border-radius", styles.borderRadius, Radius.toString),
      s("border-top-left-radius", styles.borderTLRadius, Radius.toString),
      s("border-top-right-radius", styles.borderTRRadius, Radius.toString),
      s("border-bottom-left-radius", styles.borderBLRadius, Radius.toString),
      s("border-bottom-right-radius", styles.borderBRRadius, Radius.toString),
      s("border-style", styles.borderStyle, BorderStyle.toString),
      s("border-color", styles.borderColor, colors),
      s("border-width", styles.borderWidth, Length.toString),
      s("border", styles.border, Border.toString),
      s("border-right", styles.borderRight, Border.toString),
      s("border-left", styles.borderLeft, Border.toString),
      s("border-top", styles.borderTop, Border.toString),
      s("border-bottom", styles.borderBottom, Border.toString),
      s("border-right-style", styles.borderRightStyle, BorderStyle.toString),
      s("border-left-style", styles.borderLeftStyle, BorderStyle.toString),
      s("border-top-style", styles.borderTopStyle, BorderStyle.toString),
      s("border-bottom-style", styles.borderBottomStyle, BorderStyle.toString),
      s("border-right-color", styles.borderRightColor, colors),
      s("border-left-color", styles.borderLeftColor, colors),
      s("border-top-color", styles.borderTopColor, colors),
      s("border-bottom-color", styles.borderBottomColor, colors),
      s("border-right-width", styles.borderRightWidth, Length.toString),
      s("border-left-width", styles.borderLeftWidth, Length.toString),
      s("border-top-width", styles.borderTopWidth, Length.toString),
      s("border-bottom-width", styles.borderBottomWidth, Length.toString),
      s("background-color", styles.bgColor, colors),
      s("background-size", styles.bgSize, BackgroundSize.toString),
      s("background-position", styles.bgPosition, BackgroundPosition.toString),
      s("background-image", styles.bgImage, BackgroundImage.toString),
      s("color", styles.color, colors),
      s("display", styles.display, Display.toString),
      s("justify-content", styles.justifyContent, JustifyContent.toString),
      s("align-items", styles.alignItems, AlignItems.toString),
      s("flex-direction", styles.flexDirection, FlexDirection.toString),
      s("flex-basis", styles.flexBasis, FlexBasis.toString),
      s("flex-wrap", styles.flexWrap, FlexWrap.toString),
      s("flex-grow", styles.flexGrow, FlexGrow.toString),
      s("align-content", styles.alignContent, AlignContent.toString),
      s("align-self", styles.alignSelf, AlignSelf.toString),
      s("justify-self", styles.justifySelf, JustifySelf.toString),
      s("flex-flow", styles.flexFlow, FlexFlow.toString),
      s("gap", styles.gap, Gap.toString),
      s("padding", styles.p, spacing),
      s("padding-left", styles.px, spacing),
      s("padding-right", styles.px, spacing),
      s("padding-top", styles.py, spacing),
      s("padding-bottom", styles.py, spacing),
      s("padding-top", styles.pt, spacing),
      s("padding-bottom", styles.pb, spacing),
      s("padding-left", styles.pl, spacing),
      s("padding-right", styles.pr, spacing),
      s("margin", styles.m, spacing),
      s("margin-left", styles.mx, spacing),
      s("margin-right", styles.mx, spacing),
      s("margin-top", styles.my, spacing),
      s("margin-bottom", styles.my, spacing),
      s("margin-top", styles.mt, spacing),
      s("margin-bottom", styles.mb, spacing),
      s("margin-left", styles.ml, spacing),
      s("margin-right", styles.mr, spacing),
      s("text-align", styles.textAlign, TextAlign.toString),
      s("font-family", styles.fontFamily, FontFamily.toString),
      s("font-weight", styles.fontWeight, FontWeight.toString),
      s("font-size", styles.fontSize, Length.toString),
      s("letter-spacing", styles.letterSpacing, Length.toString),
      s("line-height", styles.lineHeight, Length.toString),
      s("width", styles.width, Length.toString),
      s("height", styles.height, Length.toString),
      s("min-width", styles.minW, Length.toString),
      s("min-height", styles.minH, Length.toString),
      s("max-width", styles.maxW, Length.toString),
      s("max-height", styles.maxH, Length.toString),
      s("position", styles.position, Position.toString),
      s("top", styles.top, Length.toString),
      s("bottom", styles.bottom, Length.toString),
      s("left", styles.left, Length.toString),
      s("right", styles.right, Length.toString),
      s("z-index", styles.zIndex, ZIndex.toString),
      s("box-sizing", styles.boxSizing, BoxSizing.toString),
      s("overflow", styles.overflow, Overflow.toString),
      s("overflow-x", styles.overflowX, Overflow.toString),
      s("overflow-y", styles.overflowY, Overflow.toString),
      s("cursor", styles.cursor, Cursor.toString),
      s("visibility", styles.visibility, Visibility.toString),
      s("list-style-type", styles.listStyleType, ListStyleType.toString),
      s("list-style-position", styles.listStylePosition, ListStylePosition.toString),
      s("list-style-image", styles.listStyleImage, ListStyleImage.toString),
      s("list-style", styles.listStyle, ListStyle.toString),
      s("outline-style", styles.outlineStyle, OutlineStyle.toString),
      s("outline", styles.outline, Outline.toString),
      s("text-decoration-style", styles.textDecorationStyle, TextDecorationStyle.toString),
      s("text-decoration-line", styles.textDecorationLine, TextDecorationLine.toString),
      s("text-decoration", styles.textDecoration, TextDecoration.toString),
      s("transform", styles.transform, Transform.toString),
    ]->Js.Array2.joinWith("\n")
  }
}
