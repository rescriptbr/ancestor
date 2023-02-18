module Make = (Config: Ancestor_Config.T) => {
  module Css = AncestorCss.Make(
    {
      type breakpoints = Config.keyOfBreakpoints
      let sizeByBreakpoints = Config.sizeByBreakpoints
    },
    {
      type colors = Config.colors
      let colors = Config.colors
    },
    {
      type spacing = Config.spacing
      let spacing = Config.spacing
    },
    {
      type radius = Config.radius
      let radius = Config.radius
    },
    {
      type zIndex = Config.zIndex
      let zIndex = Config.zIndex
    },
    {
      type fontFamily = Config.fontFamily
      type fontSize = Config.fontSize
      type fontWeight = Config.fontWeight
      type lineHeight = Config.lineHeight
      type letterSpacing = Config.letterSpacing
      let fontFamily = Config.fontFamily
      let fontSize = Config.fontSize
      let fontWeight = Config.fontWeight
      let lineHeight = Config.lineHeight
      let letterSpacing = Config.letterSpacing
    },
    {
      type boxShadow = Config.boxShadow
      type textShadow = Config.textShadow
      let boxShadow = Config.boxShadow
      let textShadow = Config.textShadow
    },
  )

  let filterEmptyValues = values =>
    values->Js.Array2.reduce((values, (breakpointName, breakpointValue)) => {
      switch breakpointValue {
      | None => values
      | Some(breakpointValue) => values->Js.Array2.concat([(breakpointName, breakpointValue)])
      }
    }, [])

  let sortBySize = ((first, _), (second, _)) => {
    Config.sizeByBreakpoints(first) - Config.sizeByBreakpoints(second)
  }

  let createResponsiveProp = (~prop, ~defaultStyles=[], transform) => {
    switch prop {
    | None => defaultStyles
    | Some(values) =>
      values
      ->Config.encode
      ->filterEmptyValues
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Js.Array2.reduce(
        (currentStyles, (breakpoint, value)) =>
          currentStyles->Js.Array2.concat([Css.breakpoint(breakpoint, transform(value))]),
        [],
      )
    }
  }

  module RulesCmp = Belt.Id.MakeComparable({
    type t = Config.keyOfBreakpoints
    let cmp = (a, b) => Pervasives.compare(a, b)
  })

  let groupRulesByBreakpoint = (transformValue, mapper, (breakpoint, maybeValue)) =>
    maybeValue
    ->Belt.Option.map(transformValue)
    ->Belt.Option.map(v => [v])
    ->Belt.Option.map(rules =>
      switch mapper->Belt.Map.get(breakpoint) {
      | None => mapper->Belt.Map.set(breakpoint, rules)
      | Some(existingRules) => {
          let updatedRules = existingRules->Js.Array2.concat(rules)
          mapper->Belt.Map.set(breakpoint, updatedRules)
        }
      }
    )
    ->Belt.Option.getWithDefault(mapper)

  let addRule = (mapper, transformValue, maybeValues) =>
    maybeValues
    ->Belt.Option.map(Config.encode)
    ->Belt.Option.map(values =>
      values->Js.Array2.reduce(groupRulesByBreakpoint(transformValue), mapper)
    )
    ->Belt.Option.getWithDefault(mapper)

  let mergeRulesByBreakpoint = values => values->Js.Array2.reduce((styles, (breakpoint, rules)) =>
      switch rules {
      | None => styles
      | Some(rules) => {
          let breakpointStyles = Css.breakpoint(breakpoint, rules)
          styles->Js.Array2.concat([breakpointStyles])
        }
      }
    , [])

  let createSelector = (selectorValue, maybeValues) =>
    maybeValues
    ->Belt.Option.map(Config.encode)
    ->Belt.Option.map(mergeRulesByBreakpoint)
    ->Belt.Option.map(values => Css.selector(. selectorValue, values))

  let createPseudoSelector = (selector, maybeValues) =>
    maybeValues
    ->Belt.Option.map(Config.encode)
    ->Belt.Option.map(mergeRulesByBreakpoint)
    ->Belt.Option.map(selector)

  let removeOptionals = items => items->Js.Array2.reduce((acc, current) =>
      switch current {
      | None => acc
      | Some(item) => acc->Js.Array2.concat([item])
      }
    , [])

  let createResponsiveStyles = (
    ~borderRadius=?,
    ~borderTLRadius=?,
    ~borderTRRadius=?,
    ~borderBLRadius=?,
    ~borderBRRadius=?,
    ~borderStyle=?,
    ~borderColor=?,
    ~borderWidth=?,
    ~borderRightStyle=?,
    ~borderLeftStyle=?,
    ~borderTopStyle=?,
    ~borderBottomStyle=?,
    ~borderRightColor=?,
    ~borderLeftColor=?,
    ~borderTopColor=?,
    ~borderBottomColor=?,
    ~borderRightWidth=?,
    ~borderLeftWidth=?,
    ~borderTopWidth=?,
    ~borderBottomWidth=?,
    ~border=?,
    ~borderRight=?,
    ~borderLeft=?,
    ~borderTop=?,
    ~borderBottom=?,
    ~bgColor=?,
    ~bgSize=?,
    ~bgPosition=?,
    ~bgImage=?,
    ~color=?,
    ~display=?,
    ~justifyContent=?,
    ~flexDirection=?,
    ~alignItems=?,
    ~flexBasis=?,
    ~flexWrap=?,
    ~flexGrow=?,
    ~alignContent=?,
    ~alignSelf=?,
    ~justifySelf=?,
    ~gap=?,
    ~p=?,
    ~py=?,
    ~px=?,
    ~pt=?,
    ~pb=?,
    ~pl=?,
    ~pr=?,
    ~m=?,
    ~mx=?,
    ~my=?,
    ~mt=?,
    ~mb=?,
    ~ml=?,
    ~mr=?,
    ~textAlign=?,
    ~fontFamily=?,
    ~fontWeight=?,
    ~fontSize=?,
    ~letterSpacing=?,
    ~lineHeight=?,
    ~width=?,
    ~height=?,
    ~minW=?,
    ~minH=?,
    ~maxW=?,
    ~maxH=?,
    ~position=?,
    ~top=?,
    ~bottom=?,
    ~left=?,
    ~right=?,
    ~zIndex=?,
    ~boxSizing=?,
    ~overflow=?,
    ~overflowX=?,
    ~overflowY=?,
    ~cursor=?,
    ~visibility=?,
    ~listStyleType=?,
    ~listStylePosition=?,
    ~listStyleImage=?,
    ~listStyle=?,
    ~outlineStyle=?,
    ~outline=?,
    ~textDecorationStyle=?,
    ~textDecorationLine=?,
    ~textDecoration=?,
    ~transform=?,
    // Support for transition
    ~transition=?,
    ~transitionProperty=?,
    ~transitionDelay=?,
    ~transitionDuration=?,
    ~transitionTimingFunction=?,
    ~transitions=?,
    // Support for pseudo
    ~_hover=?,
    ~_focus=?,
    ~_active=?,
    ~_focusWithin=?,
    ~_focusVisible=?,
    ~_disabled=?,
    ~_before=?,
    ~_after=?,
    ~_even=?,
    ~_odd=?,
    ~_first=?,
    ~_last=?,
    ~_notFirst=?,
    ~_notLast=?,
    (),
  ) => {
    let ps = createPseudoSelector
    let cs = createSelector

    let rules =
      Belt.Map.make(~id=module(RulesCmp))
      ->addRule(Css.color, color)
      ->addRule(Css.backgroundColor, bgColor)
      // Margin
      ->addRule(Css.margin, m)
      ->addRule(Css.marginBottom, my)
      ->addRule(Css.marginTop, my)
      ->addRule(Css.marginRight, mx)
      ->addRule(Css.marginLeft, mx)
      ->addRule(Css.marginTop, mt)
      ->addRule(Css.marginBottom, mb)
      ->addRule(Css.marginRight, mr)
      ->addRule(Css.marginLeft, ml)
      // Padding
      ->addRule(Css.padding, p)
      ->addRule(Css.paddingBottom, py)
      ->addRule(Css.paddingTop, py)
      ->addRule(Css.paddingRight, px)
      ->addRule(Css.paddingLeft, px)
      ->addRule(Css.paddingTop, pt)
      ->addRule(Css.paddingBottom, pb)
      ->addRule(Css.paddingRight, pr)
      ->addRule(Css.paddingLeft, pl)
      ->addRule(Css.zIndex, zIndex)
      // Border Radius
      ->addRule(Css.borderRadius, borderRadius)
      ->addRule(Css.borderTopLeftRadius, borderTLRadius)
      ->addRule(Css.borderTopRightRadius, borderTRRadius)
      ->addRule(Css.borderBottomLeftRadius, borderBLRadius)
      ->addRule(Css.borderBottomRightRadius, borderBRRadius)
      // Border
      ->addRule(Css.borderStyle, borderStyle)
      ->addRule(Css.borderColor, borderColor)
      ->addRule(Css.borderWidth, borderWidth)
      ->addRule(Css.borderRightStyle, borderRightStyle)
      ->addRule(Css.borderLeftStyle, borderLeftStyle)
      ->addRule(Css.borderTopStyle, borderTopStyle)
      ->addRule(Css.borderBottomStyle, borderBottomStyle)
      ->addRule(Css.borderRightColor, borderRightColor)
      ->addRule(Css.borderLeftColor, borderLeftColor)
      ->addRule(Css.borderTopColor, borderTopColor)
      ->addRule(Css.borderBottomColor, borderBottomColor)
      ->addRule(Css.borderRightWidth, borderRightWidth)
      ->addRule(Css.borderLeftWidth, borderLeftWidth)
      ->addRule(Css.borderTopWidth, borderTopWidth)
      ->addRule(Css.borderBottomWidth, borderBottomWidth)
      ->addRule(((size, style, color)) => Css.border(size, style, color), border)
      ->addRule(((size, style, color)) => Css.borderRight(size, style, color), borderRight)
      ->addRule(((size, style, color)) => Css.borderLeft(size, style, color), borderLeft)
      ->addRule(((size, style, color)) => Css.borderTop(size, style, color), borderTop)
      ->addRule(((size, style, color)) => Css.borderBottom(size, style, color), borderBottom)
      ->addRule(Css.backgroundSize, bgSize)
      ->addRule(Css.backgroundPosition, bgPosition)
      ->addRule(Css.backgroundImage, bgImage)
      // Flex
      ->addRule(Css.display, display)
      ->addRule(Css.justifyContent, justifyContent)
      ->addRule(Css.flexDirection, flexDirection)
      ->addRule(Css.alignItems, alignItems)
      ->addRule(Css.flexBasis, flexBasis)
      ->addRule(Css.flexWrap, flexWrap)
      ->addRule(Css.flexGrow, flexGrow)
      ->addRule(Css.alignContent, alignContent)
      ->addRule(Css.alignSelf, alignSelf)
      ->addRule(Css.justifySelf, justifySelf)
      ->addRule(Css.gap, gap)
      // Others
      ->addRule(Css.textAlign, textAlign)
      ->addRule(Css.fontFamily, fontFamily)
      ->addRule(Css.fontWeight, fontWeight)
      ->addRule(Css.fontSize, fontSize)
      ->addRule(Css.letterSpacing, letterSpacing)
      ->addRule(Css.lineHeight, lineHeight)
      ->addRule(Css.width, width)
      ->addRule(Css.height, height)
      ->addRule(Css.minWidth, minW)
      ->addRule(Css.minHeight, minH)
      ->addRule(Css.maxWidth, maxW)
      ->addRule(Css.maxHeight, maxH)
      ->addRule(Css.position, position)
      ->addRule(Css.top, top)
      ->addRule(Css.bottom, bottom)
      ->addRule(Css.left, left)
      ->addRule(Css.right, right)
      ->addRule(Css.boxSizing, boxSizing)
      ->addRule(Css.overflow, overflow)
      ->addRule(Css.overflowX, overflowX)
      ->addRule(Css.overflowY, overflowY)
      ->addRule(Css.cursor, cursor)
      ->addRule(Css.visibility, visibility)
      ->addRule(Css.listStyleType, listStyleType)
      ->addRule(Css.listStylePosition, listStylePosition)
      ->addRule(Css.listStyleImage, listStyleImage)
      ->addRule(((type_, position, image)) => Css.listStyle(type_, position, image), listStyle)
      ->addRule(Css.outlineStyle, outlineStyle)
      ->addRule(((size, style, color)) => Css.outline(size, style, color), outline)
      ->addRule(Css.textDecorationStyle, textDecorationStyle)
      ->addRule(Css.textDecorationLine, textDecorationLine)
      ->addRule(Css.textDecoration, textDecoration)
      ->addRule(Css.transform, transform)
      ->addRule(Css.transitionValue, transition)
      ->addRule(Css.transitionProperty, transitionProperty)
      ->addRule(Css.transitionDelay, transitionDelay)
      ->addRule(Css.transitionDuration, transitionDuration)
      ->addRule(Css.transitionTimingFunction, transitionTimingFunction)
      ->addRule(Css.transitions, transitions)

    let pseudoSelectorsRules =
      [
        ps(Css.hover, _hover),
        ps(Css.hover, _hover),
        ps(Css.focus, _focus),
        ps(Css.active, _active),
        ps(Css.focusWithin, _focusWithin),
        ps(Css.focusVisible, _focusVisible),
        ps(Css.disabled, _disabled),
        ps(Css.before, _before),
        ps(Css.after, _after),
        ps(Css.first, _first),
        cs("&:nth-of-type(even)", _even),
        cs("&:nth-of-type(odd)", _odd),
        cs("&:last-of-type", _last),
        cs("&:not(:first-of-type)", _notFirst),
        cs("&:not(:last-of-type)", _notLast),
      ]->removeOptionals

    let parsedRules =
      rules
      ->Belt.Map.toArray
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Js.Array2.map(((breakpoint, rules)) => Css.breakpoint(breakpoint, rules))
      ->Js.Array2.concat(pseudoSelectorsRules)

    Css.style(. parsedRules)
  }
}
