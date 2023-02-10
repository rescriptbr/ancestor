/*
 *  NOTE: AncestorCss defaults.
 */
module Defaults = {
  let identity = v => v

  module Breakpoints = {
    type breakpoints = [#xs | #sm | #md | #lg | #xl]
    let sizeByBreakpoints = breakpoint =>
      switch breakpoint {
      | #xs => 0
      | #sm => 475
      | #md => 920
      | #lg => 1280
      | #xl => 1920
      }
  }

  module Colors = {
    type colors = AncestorCss_WrappedTypes.Color.t
    let colors = identity
  }

  module Spacing = {
    type spacing = int
    let spacing = v => #px(v * 8)
  }

  module Radius = {
    type radius = int
    let radius = v => #px(v * 8)
  }

  module ZIndex = {
    type zIndex = int
    let zIndex = identity
  }

  module FontSize = {
    type fontSize = Css_AtomicTypes.Length.t
    let fontSize = identity
  }

  module FontFamily = {
    type fontFamily = AncestorCss_WrappedTypes.FontFamily.t
    let fontFamily = identity
  }

  module FontWeight = {
    type fontWeight = Css_AtomicTypes.FontWeight.t
    let fontWeight = identity
  }

  module LineHeight = {
    type lineHeight = AncestorCss_WrappedTypes.LineHeight.t
    let lineHeight = identity
  }

  module LetterSpacing = {
    type letterSpacing = Css_AtomicTypes.Length.t
    let letterSpacing = identity
  }

  module Typography: AncestorCss_Config.Typography = {
    include FontSize
    include FontFamily
    include FontWeight
    include LineHeight
    include LetterSpacing
  }

  module BoxShadows = {
    type boxShadow = AncestorCss_WrappedTypes.BoxShadow.t
    let boxShadow = identity
  }

  module TextShadows = {
    type textShadow = AncestorCss_WrappedTypes.TextShadow.t
    let textShadow = identity
  }

  module Shadows = {
    include BoxShadows
    include TextShadows
  }
}

module Make = (
  Breakpoints: AncestorCss_Config.Breakpoints,
  CustomColors: AncestorCss_Config.Colors,
  CustomSpacing: AncestorCss_Config.Spacing,
  CustomRadius: AncestorCss_Config.Radius,
  CustomZIndex: AncestorCss_Config.ZIndex,
  CustomTypography: AncestorCss_Config.Typography,
  CustomShadows: AncestorCss_Config.Shadows,
) => {
  include CssJs

  let zIndex = x => Css_Js_Core.zIndex(x->CustomZIndex.zIndex)
  /*
   * Colors
   */
  let color = x => Css_Js_Core.color(x->CustomColors.colors)
  let backgroundColor = x => Css_Js_Core.backgroundColor(x->CustomColors.colors)

  let border = (length, style, color) =>
    Css_Js_Core.border(length, style, color->CustomColors.colors)
  let borderBottom = (length, style, color) =>
    Css_Js_Core.borderBottom(length, style, color->CustomColors.colors)
  let borderTop = (length, style, color) =>
    Css_Js_Core.borderTop(length, style, color->CustomColors.colors)
  let borderLeft = (length, style, color) =>
    Css_Js_Core.borderLeft(length, style, color->CustomColors.colors)
  let borderRight = (length, style, color) =>
    Css_Js_Core.borderRight(length, style, color->CustomColors.colors)

  let borderColor = x => Css_Js_Core.borderColor(x->CustomColors.colors)
  let borderTopColor = x => Css_Js_Core.borderTopColor(x->CustomColors.colors)
  let borderBottomColor = x => Css_Js_Core.borderBottomColor(x->CustomColors.colors)
  let borderLeftColor = x => Css_Js_Core.borderLeftColor(x->CustomColors.colors)
  let borderRightColor = x => Css_Js_Core.borderRightColor(x->CustomColors.colors)

  let textDecorationColor = x => Css_Js_Core.textDecorationColor(x->CustomColors.colors)

  let outline = (size, style, color) => Css_Js_Core.outline(size, style, color->CustomColors.colors)
  let outlineColor = x => Css_Js_Core.outlineColor(x->CustomColors.colors)

  /*
   * Radius
   */
  let borderRadius = x => Css_Js_Core.borderRadius(x->CustomRadius.radius)
  let borderTopLeftRadius = x => Css_Js_Core.borderTopLeftRadius(x->CustomRadius.radius)
  let borderTopRightRadius = x => Css_Js_Core.borderTopRightRadius(x->CustomRadius.radius)
  let borderBottomLeftRadius = x => Css_Js_Core.borderTopLeftRadius(x->CustomRadius.radius)
  let borderBottomRightRadius = x => Css_Js_Core.borderTopRightRadius(x->CustomRadius.radius)

  /*
   * Spacing
   */
  let gap = x => x->CustomSpacing.spacing->Css_Js_Core.gap
  let gap2 = (~rowGap, ~columnGap) =>
    Css_Js_Core.gap2(
      ~rowGap=rowGap->CustomSpacing.spacing,
      ~columnGap=columnGap->CustomSpacing.spacing,
    )
  let padding = x => x->CustomSpacing.spacing->Css_Js_Core.padding
  let padding2 = (~v, ~h) =>
    Css_Js_Core.padding2(~v=v->CustomSpacing.spacing, ~h=h->CustomSpacing.spacing)
  let padding3 = (~top, ~h, ~bottom) =>
    Css_Js_Core.padding3(
      ~top=top->CustomSpacing.spacing,
      ~h=h->CustomSpacing.spacing,
      ~bottom=bottom->CustomSpacing.spacing,
    )
  let padding4 = (~top, ~right, ~bottom, ~left) =>
    Css_Js_Core.padding4(
      ~top=top->CustomSpacing.spacing,
      ~right=right->CustomSpacing.spacing,
      ~bottom=bottom->CustomSpacing.spacing,
      ~left=left->CustomSpacing.spacing,
    )

  let paddingBottom = x => x->CustomSpacing.spacing->Css_Js_Core.paddingBottom
  let paddingLeft = x => x->CustomSpacing.spacing->Css_Js_Core.paddingLeft
  let paddingTop = x => x->CustomSpacing.spacing->Css_Js_Core.paddingTop
  let paddingRight = x => x->CustomSpacing.spacing->Css_Js_Core.paddingRight

  let margin = x => x->CustomSpacing.spacing->Css_Js_Core.margin
  let margin2 = (~v, ~h) =>
    Css_Js_Core.margin2(~v=v->CustomSpacing.spacing, ~h=h->CustomSpacing.spacing)
  let margin3 = (~top, ~h, ~bottom) =>
    Css_Js_Core.margin3(
      ~top=top->CustomSpacing.spacing,
      ~h=h->CustomSpacing.spacing,
      ~bottom=bottom->CustomSpacing.spacing,
    )
  let margin4 = (~top, ~right, ~bottom, ~left) =>
    Css_Js_Core.margin4(
      ~top=top->CustomSpacing.spacing,
      ~right=right->CustomSpacing.spacing,
      ~bottom=bottom->CustomSpacing.spacing,
      ~left=left->CustomSpacing.spacing,
    )

  let marginBottom = x => x->CustomSpacing.spacing->Css_Js_Core.marginBottom
  let marginLeft = x => x->CustomSpacing.spacing->Css_Js_Core.marginLeft
  let marginTop = x => x->CustomSpacing.spacing->Css_Js_Core.marginTop
  let marginRight = x => x->CustomSpacing.spacing->Css_Js_Core.marginRight

  let breakpoint = (token: Breakpoints.breakpoints, styles) =>
    Css_Js_Core.media(.
      `(min-width:${token->Breakpoints.sizeByBreakpoints->Js.Int.toString}px)`,
      styles,
    )

  /*
   * Typography
   */
  let fontFamily = x => x->CustomTypography.fontFamily->Css_Js_Core.fontFamily
  let fontSize = x => x->CustomTypography.fontSize->Css_Js_Core.fontSize
  let fontWeight = x => x->CustomTypography.fontWeight->Css_Js_Core.fontWeight
  let lineHeight = x => x->CustomTypography.lineHeight->Css_Js_Core.lineHeight
  let letterSpacing = x => x->CustomTypography.letterSpacing->Css_Js_Core.letterSpacing

  /*
   * Shadows
   */
  module TokenizedShadow = {
    let box = (~x=?, ~y=?, ~blur=?, ~spread=?, ~inset=?, color) =>
      CssJs.Shadow.box(~x?, ~y?, ~blur?, ~spread?, ~inset?, color)

    let text = (~x=?, ~y=?, ~blur=?, color) => CssJs.Shadow.text(~x?, ~y?, ~blur?, color)
  }
  let boxShadow = x => x->CustomShadows.boxShadow->CssJs.boxShadow
  let textShadow = x => x->CustomShadows.textShadow->CssJs.textShadow
  /*
   *  HACK: Unfortunately we need to override these two fucntions
   *  because we can't convert an array of tokens into an array of box-shadows.
   */
  let boxShadows = x => {
    let value =
      x
      ->Js.Array2.map(CustomShadows.boxShadow)
      ->Js.Array2.map(x =>
        switch x {
        | #...Css_Js_Core.Shadow.t as value => Css_Js_Core.Shadow.toString(value)
        | #...Css_AtomicTypes.Var.t as value => Css_AtomicTypes.Var.toString(value)
        }
      )
      ->Js.Array2.joinWith(", ")

    CssJs.unsafe("boxShadow", value)
  }

  let textShadows = x => {
    let value =
      x
      ->Js.Array2.map(CustomShadows.textShadow)
      ->Js.Array2.map(x =>
        switch x {
        | #...Css_Js_Core.Shadow.t as value => Css_Js_Core.Shadow.toString(value)
        | #...Css_AtomicTypes.Var.t as value => Css_AtomicTypes.Var.toString(value)
        }
      )
      ->Js.Array2.joinWith(", ")

    CssJs.unsafe("textShadow", value)
  }

  /*
   * Aliases to make the DX compatible with @ancestor-ui/core
   */
  let bgColor = backgroundColor
  let minW = minWidth
  let maxW = maxWidth
  let minH = minHeight
  let maxH = maxHeight
}
