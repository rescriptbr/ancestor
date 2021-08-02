module type AncestorCoreConfig = {
  type breakpoints<'value>

  let spacing: float
  let sizeByBreakpoints: breakpoints<'value> => int
  let unboxBreakpointValue: breakpoints<'value> => 'value
}

module Make = (Config: AncestorCoreConfig) => {
  include Ancestor_CoreTypes.Make({
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
    ~display: option<display>=?,
    ~justifyContent: option<justifyContent>=?,
    ~flexDirection: option<flexDirection>=?,
    ~alignItems: option<alignItems>=?,
    ~flexGrow: option<flexGrow>=?,
    ~flexShrink: option<flexShrink>=?,
    ~order: option<order>=?,
    ~alignSelf: option<alignSelf>=?,
    ~flexBasis: option<size>=?,
    // Padding
    ~p: option<spacing>=?,
    ~px: option<spacing>=?,
    ~py: option<spacing>=?,
    ~pt: option<spacing>=?,
    ~pb: option<spacing>=?,
    ~pl: option<spacing>=?,
    ~pr: option<spacing>=?,
    // Margin
    ~m: option<spacing>=?,
    ~mx: option<spacing>=?,
    ~my: option<spacing>=?,
    ~mt: option<spacing>=?,
    ~mb: option<spacing>=?,
    ~ml: option<spacing>=?,
    ~mr: option<spacing>=?,
    // Texts
    ~textAlign: option<textAlign>=?,
    ~letterSpacing: option<size>=?,
    ~lineHeight: option<size>=?,
    // Sizing
    ~width: option<size>=?,
    ~height: option<size>=?,
    ~minW: option<size>=?,
    ~minH: option<size>=?,
    ~maxW: option<size>=?,
    ~maxH: option<size>=?,
    // Placement
    ~position: option<position>=?,
    ~top: option<size>=?,
    ~bottom: option<size>=?,
    ~left: option<size>=?,
    ~right: option<size>=?,
    ~zIndex: option<size>=?,
    // Box sizing
    ~boxSizing: option<boxSizing>=?,
    (),
  ) =>
    [
      // Flex
      createStyles("display", display, stringify),
      createStyles("justify-content", justifyContent, stringify),
      createStyles("align-items", alignItems, stringify),
      createStyles("flex-direction", flexDirection, stringify),
      createStyles("flex-grow", flexGrow, stringifyFlexValue),
      createStyles("flex-shrink", flexShrink, stringifyFlexValue),
      createStyles("align-self", alignSelf, stringifyAlignSelf),
      createStyles("order", order, stringifyFlexValue),
      createStyles("flex-basis", flexBasis, stringifySize),
      // Padding
      createStyles("padding", p, stringifySpacing),
      createStyles("padding-left", px, stringifySpacing),
      createStyles("padding-right", px, stringifySpacing),
      createStyles("padding-top", py, stringifySpacing),
      createStyles("padding-bottom", py, stringifySpacing),
      createStyles("padding-top", pt, stringifySpacing),
      createStyles("padding-bottom", pb, stringifySpacing),
      createStyles("padding-left", pl, stringifySpacing),
      createStyles("padding-right", pr, stringifySpacing),
      // Margin
      createStyles("margin", m, stringifySpacing),
      createStyles("margin-left", mx, stringifySpacing),
      createStyles("margin-right", mx, stringifySpacing),
      createStyles("margin-top", my, stringifySpacing),
      createStyles("margin-bottom", my, stringifySpacing),
      createStyles("margin-top", mt, stringifySpacing),
      createStyles("margin-bottom", mb, stringifySpacing),
      createStyles("margin-left", ml, stringifySpacing),
      createStyles("margin-right", mr, stringifySpacing),
      // Texts
      createStyles("text-align", textAlign, stringify),
      createStyles("letter-spacing", letterSpacing, stringifySize),
      createStyles("line-height", lineHeight, stringifySize),
      // Sizing
      createStyles("width", width, stringifySize),
      createStyles("height", height, stringifySize),
      createStyles("min-width", minW, stringifySize),
      createStyles("min-height", minH, stringifySize),
      createStyles("max-width", maxW, stringifySize),
      createStyles("max-height", maxH, stringifySize),
      // Position
      createStyles("position", position, stringify),
      // Placement
      createStyles("top", top, stringifySize),
      createStyles("bottom", bottom, stringifySize),
      createStyles("left", left, stringifySize),
      createStyles("right", right, stringifySize),
      createStyles("z-index", zIndex, stringify),
      // Box sizing
      createStyles("box-sizing", boxSizing, stringify),
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
      ~column: option<columnSize>=?,
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
                    `flex-basis: ${value->Config.unboxBreakpointValue->basisFromFloat}`,
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
