module Make = (Config: Ancestor_Config.T) => {
  module Styles = Ancestor_Styles.Make(Config)
  module Make = (
    Css: {
      let useCss: unit => Styles.Css.useCssApi
    },
  ) => {
    module Internal__Base = Ancestor_Base.Make(Config)
    module Base = Internal__Base.Make(Css)

    let createHidden = (~on, ()) => {
      /**
     * Reference: https://github.com/twbs/bootstrap/blob/main/scss/mixins/_visually-hidden.scss#L8
     */
      let hiddenStyles = `
      position: absolute;
      width: 1px;
      height: 1px;
      padding: 0;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      white-space: nowrap;
      border: 0;
    `
      let visibleStyles = `
      position: static;
      width: auto;
      height: auto;
      padding: 0;
      overflow: visible;
      white-space: normal;
      border: initial;
      clip: initial;
    `

      let onStyles = Styles.createResponsiveProp(~prop=on, on =>
        switch on {
        | false => visibleStyles
        | true => hiddenStyles
        }
      )

      Emotion.rawCss(onStyles)
    }

    @react.component
    let make = (
      ~on: option<Config.breakpoints<bool>>=?,
      // declaration:start
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
      // declaration:end
      // React props
      ~children=?,
      ~dangerouslySetInnerHTML=?,
      ~innerRef=?,
      // DOM Props
      ~className="",
      ~tag: Ancestor_React.tags=#div,
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
        className={
          let hiddenClassName = createHidden(~on, ())
          `${hiddenClassName} ${className}`
        }
        // forward:start
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
}
