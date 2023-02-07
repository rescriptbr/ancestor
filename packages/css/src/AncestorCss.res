module Make = (
  Breakpoints: AncestorCss_Config.Breakpoints,
  CustomColors: AncestorCss_Config.Colors,
  CustomSpacing: AncestorCss_Config.Spacing,
  CustomRadius: AncestorCss_Config.Radius,
  CustomZIndex: AncestorCss_Config.ZIndex,
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
  let borderColor = x => Css_Js_Core.borderColor(x->CustomColors.colors)
  let borderTopColor = x => Css_Js_Core.borderTopColor(x->CustomColors.colors)
  let borderBottomColor = x => Css_Js_Core.borderBottomColor(x->CustomColors.colors)
  let borderLeftColor = x => Css_Js_Core.borderLeftColor(x->CustomColors.colors)
  let borderRightColor = x => Css_Js_Core.borderRightColor(x->CustomColors.colors)

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
}
