module type AncestorCoreConfig = {
  type breakpoints<'value>

  let spacing: float
  let sizeByBreakpoints: breakpoints<'value> => int
  let unboxBreakpointValue: breakpoints<'value> => 'value
}

module Make = (Config: AncestorCoreConfig) => {
  module Types = Ancestor_CoreTypes.Make({
    type breakpoints<'a> = Config.breakpoints<'a>
    let spacing = Config.spacing
    let unboxBreakpointValue = Config.unboxBreakpointValue
  })

  %%private(
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
      ~display: option<Types.display>=?,
      ~justifyContent: option<Types.justifyContent>=?,
      ~flexDirection: option<Types.flexDirection>=?,
      ~alignItems: option<Types.alignItems>=?,
      ~flexGrow: option<Types.flexGrow>=?,
      ~flexShrink: option<Types.flexShrink>=?,
      ~order: option<Types.order>=?,
      ~alignSelf: option<Types.alignSelf>=?,
      ~flexBasis: option<Types.size>=?,
      // Padding
      ~p: option<Types.spacing>=?,
      ~px: option<Types.spacing>=?,
      ~py: option<Types.spacing>=?,
      ~pt: option<Types.spacing>=?,
      ~pb: option<Types.spacing>=?,
      ~pl: option<Types.spacing>=?,
      ~pr: option<Types.spacing>=?,
      // Margin
      ~m: option<Types.spacing>=?,
      ~mx: option<Types.spacing>=?,
      ~my: option<Types.spacing>=?,
      ~mt: option<Types.spacing>=?,
      ~mb: option<Types.spacing>=?,
      ~ml: option<Types.spacing>=?,
      ~mr: option<Types.spacing>=?,
      // Texts
      ~textAlign: option<Types.textAlign>=?,
      ~letterSpacing: option<Types.size>=?,
      ~lineHeight: option<Types.size>=?,
      // Sizing
      ~width: option<Types.size>=?,
      ~height: option<Types.size>=?,
      ~minW: option<Types.size>=?,
      ~minH: option<Types.size>=?,
      ~maxW: option<Types.size>=?,
      ~maxH: option<Types.size>=?,
      // Placement
      ~position: option<Types.position>=?,
      ~top: option<Types.size>=?,
      ~bottom: option<Types.size>=?,
      ~left: option<Types.size>=?,
      ~right: option<Types.size>=?,
      ~zIndex: option<Types.size>=?,
      // Box sizing
      ~boxSizing: option<Types.boxSizing>=?,
      (),
    ) =>
      [
        // Flex
        createStyles("display", display, Types.stringify),
        createStyles("justify-content", justifyContent, Types.stringify),
        createStyles("align-items", alignItems, Types.stringify),
        createStyles("flex-direction", flexDirection, Types.stringify),
        createStyles("flex-grow", flexGrow, Types.stringifyFlexValue),
        createStyles("flex-shrink", flexShrink, Types.stringifyFlexValue),
        createStyles("align-self", alignSelf, Types.stringifyAlignSelf),
        createStyles("order", order, Types.stringifyFlexValue),
        createStyles("flex-basis", flexBasis, Types.stringifySize),
        // Padding
        createStyles("padding", p, Types.stringifySpacing),
        createStyles("padding-left", px, Types.stringifySpacing),
        createStyles("padding-right", px, Types.stringifySpacing),
        createStyles("padding-top", py, Types.stringifySpacing),
        createStyles("padding-bottom", py, Types.stringifySpacing),
        createStyles("padding-top", pt, Types.stringifySpacing),
        createStyles("padding-bottom", pb, Types.stringifySpacing),
        createStyles("padding-left", pl, Types.stringifySpacing),
        createStyles("padding-right", pr, Types.stringifySpacing),
        // Margin
        createStyles("margin", m, Types.stringifySpacing),
        createStyles("margin-left", mx, Types.stringifySpacing),
        createStyles("margin-right", mx, Types.stringifySpacing),
        createStyles("margin-top", my, Types.stringifySpacing),
        createStyles("margin-bottom", my, Types.stringifySpacing),
        createStyles("margin-top", mt, Types.stringifySpacing),
        createStyles("margin-bottom", mb, Types.stringifySpacing),
        createStyles("margin-left", ml, Types.stringifySpacing),
        createStyles("margin-right", mr, Types.stringifySpacing),
        // Texts
        createStyles("text-align", textAlign, Types.stringify),
        createStyles("letter-spacing", letterSpacing, Types.stringifySize),
        createStyles("line-height", lineHeight, Types.stringifySize),
        // Sizing
        createStyles("width", width, Types.stringifySize),
        createStyles("height", height, Types.stringifySize),
        createStyles("min-width", minW, Types.stringifySize),
        createStyles("min-height", minH, Types.stringifySize),
        createStyles("max-width", maxW, Types.stringifySize),
        createStyles("max-height", maxH, Types.stringifySize),
        // Position
        createStyles("position", position, Types.stringify),
        // Placement
        createStyles("top", top, Types.stringifySize),
        createStyles("bottom", bottom, Types.stringifySize),
        createStyles("left", left, Types.stringifySize),
        createStyles("right", right, Types.stringifySize),
        createStyles("z-index", zIndex, Types.stringify),
        // Box sizing
        createStyles("box-sizing", boxSizing, Types.stringify),
      ]->Js.Array2.joinWith("")
  )
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

            `${className} ${responsiveStyles}`
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

  module Box = {
    %%private(
      let createBox = (styles, value) =>
        greaterThan(
          styles,
          value,
          `flex-basis: ${value->Config.unboxBreakpointValue->Types.basisFromFloat}`,
        )
    )

    let make = Base.make

    let makeProps = (~className="", ~size: option<Types.columnSize>=?) =>
      Base.makeProps(
        ~className={
          let box =
            size
            ->Belt.Option.map(values =>
              values->Js.Array2.sortInPlaceWith(sortBySize)->Belt.Array.reduce("", createBox)
            )
            ->Belt.Option.getWithDefault("")
            ->Ancestor_Emotion.css
          `${box} ${className}`
        },
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
