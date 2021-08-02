module type Config = {
  type breakpoints<'value>

  let spacing: float

  let sizeByBreakpoints: breakpoints<'value> => int

  let unboxBreakpointValue: breakpoints<'value> => 'value
}

module Make = (Config: Config) => {
  module CoreTypes = Ancestor_CoreTypes.Make({
    type breakpoints<'a> = Config.breakpoints<'a>
    let spacing = Config.spacing
    let unboxBreakpointValue = Config.unboxBreakpointValue
  })

  let createBreakpointSize = device => `${device->Config.sizeByBreakpoints->Belt.Int.toString}px`

  let greaterThan = (current, device: Config.breakpoints<'a>, styles) =>
    `
    ${current}
    @media (min-width: ${device->createBreakpointSize}) {
      ${styles}
    }
  `

  let sortBySize = (first, second) =>
    Config.sizeByBreakpoints(first) - Config.sizeByBreakpoints(second)

  let mergeStyles = (cssKey, stringify, styles, breakpointValue) =>
    greaterThan(
      styles,
      breakpointValue,
      `${cssKey}: ${breakpointValue->Config.unboxBreakpointValue->stringify};`,
    )

  let createStyles = (cssKey, maybeCssValues, stringify) =>
    maybeCssValues
    ->Belt.Option.map(values =>
      values
      ->Js.Array2.sortInPlaceWith(sortBySize)
      ->Belt.Array.reduce("", mergeStyles(cssKey, stringify))
    )
    ->Belt.Option.getWithDefault("")

  let createResponsiveStyles = (
    // Flex
    ~display: option<CoreTypes.display>=?,
    ~justifyContent: option<CoreTypes.justifyContent>=?,
    ~flexDirection: option<CoreTypes.flexDirection>=?,
    ~alignItems: option<CoreTypes.alignItems>=?,
    ~flexGrow: option<CoreTypes.flexGrow>=?,
    ~flexShrink: option<CoreTypes.flexShrink>=?,
    ~order: option<CoreTypes.order>=?,
    ~alignSelf: option<CoreTypes.alignSelf>=?,
    ~flexBasis: option<CoreTypes.size>=?,
    // Padding
    ~p: option<CoreTypes.spacing>=?,
    ~px: option<CoreTypes.spacing>=?,
    ~py: option<CoreTypes.spacing>=?,
    ~pt: option<CoreTypes.spacing>=?,
    ~pb: option<CoreTypes.spacing>=?,
    ~pl: option<CoreTypes.spacing>=?,
    ~pr: option<CoreTypes.spacing>=?,
    // Margin
    ~m: option<CoreTypes.spacing>=?,
    ~mx: option<CoreTypes.spacing>=?,
    ~my: option<CoreTypes.spacing>=?,
    ~mt: option<CoreTypes.spacing>=?,
    ~mb: option<CoreTypes.spacing>=?,
    ~ml: option<CoreTypes.spacing>=?,
    ~mr: option<CoreTypes.spacing>=?,
    // Texts
    ~textAlign: option<CoreTypes.textAlign>=?,
    ~letterSpacing: option<CoreTypes.size>=?,
    ~lineHeight: option<CoreTypes.size>=?,
    // Sizing
    ~width: option<CoreTypes.size>=?,
    ~height: option<CoreTypes.size>=?,
    ~minW: option<CoreTypes.size>=?,
    ~minH: option<CoreTypes.size>=?,
    ~maxW: option<CoreTypes.size>=?,
    ~maxH: option<CoreTypes.size>=?,
    // Placement
    ~position: option<CoreTypes.position>=?,
    ~top: option<CoreTypes.size>=?,
    ~bottom: option<CoreTypes.size>=?,
    ~left: option<CoreTypes.size>=?,
    ~right: option<CoreTypes.size>=?,
    ~zIndex: option<CoreTypes.size>=?,
    // Box sizing
    ~boxSizing: option<CoreTypes.boxSizing>=?,
    (),
  ) =>
    [
      // Flex
      createStyles("display", display, CoreTypes.stringify),
      createStyles("justify-content", justifyContent, CoreTypes.stringify),
      createStyles("align-items", alignItems, CoreTypes.stringify),
      createStyles("flex-direction", flexDirection, CoreTypes.stringify),
      createStyles("flex-grow", flexGrow, CoreTypes.stringifyFlexValue),
      createStyles("flex-shrink", flexShrink, CoreTypes.stringifyFlexValue),
      createStyles("align-self", alignSelf, CoreTypes.stringifyAlignSelf),
      createStyles("order", order, CoreTypes.stringifyFlexValue),
      createStyles("flex-basis", flexBasis, CoreTypes.stringifySize),
      // Padding
      createStyles("padding", p, CoreTypes.stringifySpacing),
      createStyles("padding-left", px, CoreTypes.stringifySpacing),
      createStyles("padding-right", px, CoreTypes.stringifySpacing),
      createStyles("padding-top", py, CoreTypes.stringifySpacing),
      createStyles("padding-bottom", py, CoreTypes.stringifySpacing),
      createStyles("padding-top", pt, CoreTypes.stringifySpacing),
      createStyles("padding-bottom", pb, CoreTypes.stringifySpacing),
      createStyles("padding-left", pl, CoreTypes.stringifySpacing),
      createStyles("padding-right", pr, CoreTypes.stringifySpacing),
      // Margin
      createStyles("margin", m, CoreTypes.stringifySpacing),
      createStyles("margin-left", mx, CoreTypes.stringifySpacing),
      createStyles("margin-right", mx, CoreTypes.stringifySpacing),
      createStyles("margin-top", my, CoreTypes.stringifySpacing),
      createStyles("margin-bottom", my, CoreTypes.stringifySpacing),
      createStyles("margin-top", mt, CoreTypes.stringifySpacing),
      createStyles("margin-bottom", mb, CoreTypes.stringifySpacing),
      createStyles("margin-left", ml, CoreTypes.stringifySpacing),
      createStyles("margin-right", mr, CoreTypes.stringifySpacing),
      // Texts
      createStyles("text-align", textAlign, CoreTypes.stringify),
      createStyles("letter-spacing", letterSpacing, CoreTypes.stringifySize),
      createStyles("line-height", lineHeight, CoreTypes.stringifySize),
      // Sizing
      createStyles("width", width, CoreTypes.stringifySize),
      createStyles("height", height, CoreTypes.stringifySize),
      createStyles("min-width", minW, CoreTypes.stringifySize),
      createStyles("min-height", minH, CoreTypes.stringifySize),
      createStyles("max-width", maxW, CoreTypes.stringifySize),
      createStyles("max-height", maxH, CoreTypes.stringifySize),
      // Position
      createStyles("position", position, CoreTypes.stringify),
      // Placement
      createStyles("top", top, CoreTypes.stringifySize),
      createStyles("bottom", bottom, CoreTypes.stringifySize),
      createStyles("left", left, CoreTypes.stringifySize),
      createStyles("right", right, CoreTypes.stringifySize),
      createStyles("z-index", zIndex, CoreTypes.stringify),
      // Box sizing
      createStyles("box-sizing", boxSizing, CoreTypes.stringify),
    ]->Js.Array2.joinWith("")

  module Base = {
    @react.component
    let make = (
      // Flex
      ~display=?,
      ~justifyContent=?,
      ~flexDirection=?,
      ~alignItems=?,
      ~flexGrow=?,
      ~flexShrink=?,
      ~alignSelf=?,
      ~order=?,
      // Padding
      ~p=?,
      ~px=?,
      ~py=?,
      ~pt=?,
      ~pb=?,
      ~pl=?,
      ~pr=?,
      //Margin
      ~m=?,
      ~mx=?,
      ~my=?,
      ~mt=?,
      ~mb=?,
      ~ml=?,
      ~mr=?,
      // Sizing
      ~width=?,
      ~height=?,
      ~minW=?,
      ~minH=?,
      ~maxW=?,
      ~maxH=?,
      // Position
      ~position=?,
      ~top=?,
      ~bottom=?,
      ~left=?,
      ~right=?,
      ~zIndex=?,
      // Box sizing
      ~boxSizing=?,
      // Props
      ~column: option<CoreTypes.columnSize>=?,
      ~tag: Ancestor_React.tags=#div,
      ~className="",
      ~children,
      // Dom Props
      ~onCopy=?,
      ~onCut=?,
      ~onPaste=?,
      ~onCompositionEnd=?,
      ~onCompositionStart=?,
      ~onCompositionUpdate=?,
      ~onKeyDown=?,
      ~onKeyPress=?,
      ~onKeyUp=?,
      ~onFocus=?,
      ~onBlur=?,
      ~onChange=?,
      ~onInput=?,
      ~onSubmit=?,
      ~onInvalid=?,
      ~onClick=?,
      ~onContextMenu=?,
      ~onDoubleClick=?,
      ~onDrag=?,
      ~onDragEnd=?,
      ~onDragEnter=?,
      ~onDragExit=?,
      ~onDragLeave=?,
      ~onDragOver=?,
      ~onDragStart=?,
      ~onDrop=?,
      ~onMouseDown=?,
      ~onMouseEnter=?,
      ~onMouseLeave=?,
      ~onMouseMove=?,
      ~onMouseOut=?,
      ~onMouseOver=?,
      ~onMouseUp=?,
      ~onSelect=?,
      ~onTouchCancel=?,
      ~onTouchEnd=?,
      ~onTouchMove=?,
      ~onTouchStart=?,
      ~onPointerOver=?,
      ~onPointerEnter=?,
      ~onPointerDown=?,
      ~onPointerMove=?,
      ~onPointerUp=?,
      ~onPointerCancel=?,
      ~onPointerOut=?,
      ~onPointerLeave=?,
      ~onGotPointerCapture=?,
      ~onLostPointerCapture=?,
      ~onScroll=?,
      ~onWheel=?,
      ~onAbort=?,
      ~onCanPlay=?,
      ~onCanPlayThrough=?,
      ~onDurationChange=?,
      ~onEmptied=?,
      ~onEncrypetd=?,
      ~onEnded=?,
      ~onError=?,
      ~onLoadedData=?,
      ~onLoadedMetadata=?,
      ~onLoadStart=?,
      ~onPause=?,
      ~onPlay=?,
      ~onPlaying=?,
      ~onProgress=?,
      ~onRateChange=?,
      ~onSeeked=?,
      ~onSeeking=?,
      ~onStalled=?,
      ~onSuspend=?,
      ~onTimeUpdate=?,
      ~onVolumeChange=?,
      ~onWaiting=?,
      ~onLoad=?,
      ~onAnimationStart=?,
      ~onAnimationEnd=?,
      ~onAnimationIteration=?,
      ~onTransitionEnd=?,
      ~dangerouslySetInnerHTML=?,
    ) =>
      Ancestor_React.createElement(
        tag,
        ReactDOM.domProps(
          ~className={
            let columnSizeClassName =
              column
              ->Belt.Option.map(values =>
                values
                ->Js.Array2.sortInPlaceWith(sortBySize)
                ->Belt.Array.reduce("", (styles, value) =>
                  greaterThan(
                    styles,
                    value,
                    `flex-basis: ${value->Config.unboxBreakpointValue->CoreTypes.basisFromFloat}`,
                  )
                )
              )
              ->Belt.Option.getWithDefault("")
              ->Ancestor_Emotion.css

            let responsiveStyles =
              createResponsiveStyles(
                ~display?,
                ~justifyContent?,
                ~flexDirection?,
                ~alignItems?,
                ~flexGrow?,
                ~flexShrink?,
                ~alignSelf?,
                ~order?,
                ~p?,
                ~py?,
                ~px?,
                ~pt?,
                ~pb?,
                ~pl?,
                ~pr?,
                ~m?,
                ~mx?,
                ~my?,
                ~mt?,
                ~mb?,
                ~ml?,
                ~mr?,
                ~width?,
                ~height?,
                ~minW?,
                ~minH?,
                ~maxW?,
                ~maxH?,
                ~position?,
                ~top?,
                ~bottom?,
                ~left?,
                ~right?,
                ~zIndex?,
                ~boxSizing?,
                (),
              )->Ancestor_Emotion.css

            `${columnSizeClassName} ${className} ${responsiveStyles}`
          },
          ~onCopy?,
          ~onCut?,
          ~onPaste?,
          ~onCompositionEnd?,
          ~onCompositionStart?,
          ~onCompositionUpdate?,
          ~onKeyDown?,
          ~onKeyPress?,
          ~onKeyUp?,
          ~onFocus?,
          ~onBlur?,
          ~onChange?,
          ~onInput?,
          ~onSubmit?,
          ~onInvalid?,
          ~onClick?,
          ~onContextMenu?,
          ~onDoubleClick?,
          ~onDrag?,
          ~onDragEnd?,
          ~onDragEnter?,
          ~onDragExit?,
          ~onDragLeave?,
          ~onDragOver?,
          ~onDragStart?,
          ~onDrop?,
          ~onMouseDown?,
          ~onMouseEnter?,
          ~onMouseLeave?,
          ~onMouseMove?,
          ~onMouseOut?,
          ~onMouseOver?,
          ~onMouseUp?,
          ~onSelect?,
          ~onTouchCancel?,
          ~onTouchEnd?,
          ~onTouchMove?,
          ~onTouchStart?,
          ~onPointerOver?,
          ~onPointerEnter?,
          ~onPointerDown?,
          ~onPointerMove?,
          ~onPointerUp?,
          ~onPointerCancel?,
          ~onPointerOut?,
          ~onPointerLeave?,
          ~onGotPointerCapture?,
          ~onLostPointerCapture?,
          ~onScroll?,
          ~onWheel?,
          ~onAbort?,
          ~onCanPlay?,
          ~onCanPlayThrough?,
          ~onDurationChange?,
          ~onEmptied?,
          ~onEncrypetd?,
          ~onEnded?,
          ~onError?,
          ~onLoadedData?,
          ~onLoadedMetadata?,
          ~onLoadStart?,
          ~onPause?,
          ~onPlay?,
          ~onPlaying?,
          ~onProgress?,
          ~onRateChange?,
          ~onSeeked?,
          ~onSeeking?,
          ~onStalled?,
          ~onSuspend?,
          ~onTimeUpdate?,
          ~onVolumeChange?,
          ~onWaiting?,
          ~onLoad?,
          ~onAnimationStart?,
          ~onAnimationEnd?,
          ~onAnimationIteration?,
          ~onTransitionEnd?,
          ~dangerouslySetInnerHTML?,
          (),
        ),
        children,
      )
  }

  module Flex = {
    let flex = Ancestor_Emotion.css(`
      width: 100%;
      flex-wrap: wrap;
      display: flex;
  `)

    let make = Base.make

    let makeProps = (~className as customClass: string="") =>
      Base.makeProps(~className=`${flex} ${customClass}`)
  }
}
