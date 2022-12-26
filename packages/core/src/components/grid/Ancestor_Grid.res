module Make = (Config: Ancestor_Config.T) => {
  module Base = Ancestor_Base.Make(Config)
  module Styles = Ancestor_Styles.Make(Config)

  %%private(
    let defaultStyles = `
      width: 100%;
      flex-wrap: wrap;
      display: flex;
    `

    let grid = (~spacing=?, ()) => {
      let spacingStyles = Styles.createResponsiveProp(~prop=spacing, ~defaultStyles, spacing => {
        let spacingInPx = spacing->Config.spacing->Ancestor_Css.Length.toString

        `
          display: flex;
          flex-wrap: wrap;
          width: calc(100% + ${spacingInPx});
          margin-left: -${spacingInPx};
          margin-top: -${spacingInPx};

          > * {
            box-sizing: border-box;
            padding-left: ${spacingInPx};
            padding-top: ${spacingInPx};
          }
          `
      })

      Emotion.rawCss(spacingStyles)
    }
  )

  @react.component
  let make = (
    // declaration:start
    ~css: option<Styles.Css.properties>=?,
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
    ~flexFlow=?,
    ~gap=?,
    ~p=?,
    ~px=?,
    ~py=?,
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
    ~_focus: option<Styles.Css.properties>=?,
    ~_hover: option<Styles.Css.properties>=?,
    ~_active: option<Styles.Css.properties>=?,
    ~_focusWithin: option<Styles.Css.properties>=?,
    ~_focusVisible: option<Styles.Css.properties>=?,
    ~_disabled: option<Styles.Css.properties>=?,
    ~_before: option<Styles.Css.properties>=?,
    ~_after: option<Styles.Css.properties>=?,
    ~_even: option<Styles.Css.properties>=?,
    ~_odd: option<Styles.Css.properties>=?,
    ~_first: option<Styles.Css.properties>=?,
    ~_last: option<Styles.Css.properties>=?,
    ~_notFirst: option<Styles.Css.properties>=?,
    ~_notLast: option<Styles.Css.properties>=?,
    // declaration:end
    // Grid props
    ~spacing: option<Config.breakpoints<Config.spacing>>=?,
    ~tag: Ancestor_React.tags=#div,
    // React props
    ~children=?,
    ~dangerouslySetInnerHTML=?,
    ~innerRef=?,
    // DOM Props
    ~className="",
    ~id=?,
    ~onClick=?,
    ~onSubmit=?,
    ~onChange=?,
    ~src=?,
    ~alt=?,
    ~ariaDetails=?,
    ~ariaDisabled=?,
    ~ariaHidden=?,
    ~ariaKeyshortcuts=?,
    ~ariaLabel=?,
    ~ariaRoledescription=?,
    ~ariaExpanded=?,
    ~ariaLevel=?,
    ~ariaModal=?,
    ~ariaMultiline=?,
    ~ariaMultiselectable=?,
    ~ariaPlaceholder=?,
    ~ariaReadonly=?,
    ~ariaRequired=?,
    ~ariaSelected=?,
    ~ariaSort=?,
    ~ariaValuemax=?,
    ~ariaValuemin=?,
    ~ariaValuenow=?,
    ~ariaValuetext=?,
    ~ariaAtomic=?,
    ~ariaBusy=?,
    ~ariaRelevant=?,
    ~ariaGrabbed=?,
    ~ariaActivedescendant=?,
    ~ariaColcount=?,
    ~ariaColindex=?,
    ~ariaColspan=?,
    ~ariaControls=?,
    ~ariaDescribedby=?,
    ~ariaErrormessage=?,
    ~ariaFlowto=?,
    ~ariaLabelledby=?,
    ~ariaOwns=?,
    ~ariaPosinset=?,
    ~ariaRowcount=?,
    ~ariaRowindex=?,
    ~ariaRowspan=?,
    ~ariaSetsize=?,
    ~defaultChecked=?,
    ~defaultValue=?,
    ~accessKey=?,
    ~contentEditable=?,
    ~contextMenu=?,
    ~lang=?,
    ~role=?,
    ~style=?,
    ~spellCheck=?,
    ~tabIndex=?,
    ~title=?,
    ~itemID=?,
    ~itemProp=?,
    ~itemRef=?,
    ~itemScope=?,
    ~itemType=?,
    ~accept=?,
    ~acceptCharset=?,
    ~action=?,
    ~allowFullScreen=?,
    ~async=?,
    ~autoComplete=?,
    ~autoCapitalize=?,
    ~autoFocus=?,
    ~autoPlay=?,
    ~challenge=?,
    ~charSet=?,
    ~checked=?,
    ~cite=?,
    ~crossOrigin=?,
    ~cols=?,
    ~colSpan=?,
    ~content=?,
    ~controls=?,
    ~coords=?,
    ~data=?,
    ~dateTime=?,
    ~default=?,
    ~defer=?,
    ~disabled=?,
    ~download=?,
    ~encType=?,
    ~form=?,
    ~formAction=?,
    ~formTarget=?,
    ~formMethod=?,
    ~headers=?,
    ~high=?,
    ~href=?,
    ~hrefLang=?,
    ~htmlFor=?,
    ~httpEquiv=?,
    ~icon=?,
    ~inputMode=?,
    ~integrity=?,
    ~keyType=?,
    ~kind=?,
    ~label=?,
    ~list=?,
    ~loop=?,
    ~low=?,
    ~manifest=?,
    ~max=?,
    ~maxLength=?,
    ~media=?,
    ~mediaGroup=?,
    ~method=?,
    ~min=?,
    ~minLength=?,
    ~multiple=?,
    ~muted=?,
    ~name=?,
    ~nonce=?,
    ~noValidate=?,
    ~open_=?,
    ~optimum=?,
    ~pattern=?,
    ~placeholder=?,
    ~playsInline=?,
    ~poster=?,
    ~preload=?,
    ~radioGroup=?,
    ~readOnly=?,
    ~rel=?,
    ~required=?,
    ~reversed=?,
    ~rows=?,
    ~rowSpan=?,
    ~sandbox=?,
    ~scope=?,
    ~scoped=?,
    ~scrolling=?,
    ~selected=?,
    ~shape=?,
    ~size=?,
    ~sizes=?,
    ~span=?,
    ~srcDoc=?,
    ~srcLang=?,
    ~srcSet=?,
    ~start=?,
    ~step=?,
    ~summary=?,
    ~target=?,
    ~type_=?,
    ~useMap=?,
    ~value=?,
    ~wrap=?,
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
    ~onInput=?,
    ~onInvalid=?,
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
  ) => {
    <Base
      className={`${grid(~spacing?, ())} ${className}`}
      // forward:start
      ?css
      ?borderRadius
      ?borderTLRadius
      ?borderTRRadius
      ?borderBLRadius
      ?borderBRRadius
      ?borderStyle
      ?borderColor
      ?borderWidth
      ?borderRightStyle
      ?borderLeftStyle
      ?borderTopStyle
      ?borderBottomStyle
      ?borderRightColor
      ?borderLeftColor
      ?borderTopColor
      ?borderBottomColor
      ?borderRightWidth
      ?borderLeftWidth
      ?borderTopWidth
      ?borderBottomWidth
      ?border
      ?borderRight
      ?borderLeft
      ?borderTop
      ?borderBottom
      ?bgColor
      ?bgSize
      ?bgPosition
      ?bgImage
      ?color
      ?display
      ?justifyContent
      ?flexDirection
      ?alignItems
      ?flexBasis
      ?flexWrap
      ?flexGrow
      ?alignContent
      ?alignSelf
      ?justifySelf
      ?flexFlow
      ?gap
      ?p
      ?px
      ?py
      ?pt
      ?pb
      ?pl
      ?pr
      ?m
      ?mx
      ?my
      ?mt
      ?mb
      ?ml
      ?mr
      ?textAlign
      ?fontFamily
      ?fontWeight
      ?fontSize
      ?letterSpacing
      ?lineHeight
      ?width
      ?height
      ?minW
      ?minH
      ?maxW
      ?maxH
      ?position
      ?top
      ?bottom
      ?left
      ?right
      ?zIndex
      ?boxSizing
      ?overflow
      ?overflowX
      ?overflowY
      ?cursor
      ?visibility
      ?listStyleType
      ?listStylePosition
      ?listStyleImage
      ?listStyle
      ?outlineStyle
      ?outline
      ?textDecorationStyle
      ?textDecorationLine
      ?textDecoration
      ?transform
      ?_focus
      ?_hover
      ?_active
      ?_focusWithin
      ?_focusVisible
      ?_disabled
      ?_before
      ?_after
      ?_even
      ?_odd
      ?_first
      ?_last
      ?_notFirst
      ?_notLast
      // forward:end
      // DOM Props
      tag
      ?id
      ?onSubmit
      ?onClick
      ?onChange
      ?dangerouslySetInnerHTML
      ?src
      ?alt
      ?children
      ?innerRef
      ?ariaDetails
      ?ariaDisabled
      ?ariaHidden
      ?ariaKeyshortcuts
      ?ariaLabel
      ?ariaRoledescription
      ?ariaExpanded
      ?ariaLevel
      ?ariaModal
      ?ariaMultiline
      ?ariaMultiselectable
      ?ariaPlaceholder
      ?ariaReadonly
      ?ariaRequired
      ?ariaSelected
      ?ariaSort
      ?ariaValuemax
      ?ariaValuemin
      ?ariaValuenow
      ?ariaValuetext
      ?ariaAtomic
      ?ariaBusy
      ?ariaRelevant
      ?ariaGrabbed
      ?ariaActivedescendant
      ?ariaColcount
      ?ariaColindex
      ?ariaColspan
      ?ariaControls
      ?ariaDescribedby
      ?ariaErrormessage
      ?ariaFlowto
      ?ariaLabelledby
      ?ariaOwns
      ?ariaPosinset
      ?ariaRowcount
      ?ariaRowindex
      ?ariaRowspan
      ?ariaSetsize
      ?defaultChecked
      ?defaultValue
      ?accessKey
      ?contentEditable
      ?contextMenu
      ?lang
      ?role
      ?style
      ?spellCheck
      ?tabIndex
      ?title
      ?itemID
      ?itemProp
      ?itemRef
      ?itemScope
      ?itemType
      ?accept
      ?acceptCharset
      ?action
      ?allowFullScreen
      ?async
      ?autoComplete
      ?autoCapitalize
      ?autoFocus
      ?autoPlay
      ?challenge
      ?charSet
      ?checked
      ?cite
      ?crossOrigin
      ?cols
      ?colSpan
      ?content
      ?controls
      ?coords
      ?data
      ?dateTime
      ?default
      ?defer
      ?disabled
      ?download
      ?encType
      ?form
      ?formAction
      ?formTarget
      ?formMethod
      ?headers
      ?high
      ?href
      ?hrefLang
      ?htmlFor
      ?httpEquiv
      ?icon
      ?inputMode
      ?integrity
      ?keyType
      ?kind
      ?label
      ?list
      ?loop
      ?low
      ?manifest
      ?max
      ?maxLength
      ?media
      ?mediaGroup
      ?method
      ?min
      ?minLength
      ?multiple
      ?muted
      ?name
      ?nonce
      ?noValidate
      ?open_
      ?optimum
      ?pattern
      ?placeholder
      ?playsInline
      ?poster
      ?preload
      ?radioGroup
      ?readOnly
      ?rel
      ?required
      ?reversed
      ?rows
      ?rowSpan
      ?sandbox
      ?scope
      ?scoped
      ?scrolling
      ?selected
      ?shape
      ?size
      ?sizes
      ?span
      ?srcDoc
      ?srcLang
      ?srcSet
      ?start
      ?step
      ?summary
      ?target
      ?type_
      ?useMap
      ?value
      ?wrap
      ?onCopy
      ?onCut
      ?onPaste
      ?onCompositionEnd
      ?onCompositionStart
      ?onCompositionUpdate
      ?onKeyDown
      ?onKeyPress
      ?onKeyUp
      ?onFocus
      ?onBlur
      ?onInput
      ?onInvalid
      ?onContextMenu
      ?onDoubleClick
      ?onDrag
      ?onDragEnd
      ?onDragEnter
      ?onDragExit
      ?onDragLeave
      ?onDragOver
      ?onDragStart
      ?onDrop
      ?onMouseDown
      ?onMouseEnter
      ?onMouseLeave
      ?onMouseMove
      ?onMouseOut
      ?onMouseOver
      ?onMouseUp
      ?onSelect
      ?onTouchCancel
      ?onTouchEnd
      ?onTouchMove
      ?onTouchStart
      ?onPointerOver
      ?onPointerEnter
      ?onPointerDown
      ?onPointerMove
      ?onPointerUp
      ?onPointerCancel
      ?onPointerOut
      ?onPointerLeave
      ?onGotPointerCapture
      ?onLostPointerCapture
      ?onScroll
      ?onWheel
      ?onAbort
      ?onCanPlay
      ?onCanPlayThrough
      ?onDurationChange
      ?onEmptied
      ?onEnded
      ?onError
      ?onLoadedData
      ?onLoadedMetadata
      ?onLoadStart
      ?onPause
      ?onPlay
      ?onPlaying
      ?onProgress
      ?onRateChange
      ?onSeeked
      ?onSeeking
      ?onStalled
      ?onSuspend
      ?onTimeUpdate
      ?onVolumeChange
      ?onWaiting
      ?onLoad
      ?onAnimationStart
      ?onAnimationEnd
      ?onAnimationIteration
      ?onTransitionEnd
    />
  }
}
