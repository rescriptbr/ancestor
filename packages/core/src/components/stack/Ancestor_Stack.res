module Make = (Config: Ancestor_Config.T) => {
  module Styles = Ancestor_Styles.Make(Config)
  module Base = Ancestor_Base.Make(Config)

  type direction = [
    | #vertical
    | #horizontal
  ]

  /**
   * Specific styles for the API.
   */
  module LocalStyles = {
    open Styles.Css

    let baseStyles = [display(#flex)]

    let createStack = (~direction=?, ()) => {
      let directionStyles = Styles.createResponsiveProp(
        ~prop=direction,
        ~defaultStyles=[flexDirection(#column)],
        direction =>
          switch direction {
          | #vertical => [flexDirection(#column)]
          | #horizontal => [flexDirection(#row)]
          },
      )

      let styles = Belt.Array.concatMany([baseStyles, directionStyles])

      style(. styles)
    }
  }

  let renderWithDivider = (children, divider) => {
    let total = React.Children.count(children)
    children->React.Children.mapWithIndex((element, index) => {
      if index == total - 1 {
        element
      } else {
        <>
          element
          divider
        </>
      }
    })
  }

  @react.component
  let make = (
    // Stack props
    ~direction: option<Config.breakpoints<direction>>=?,
    ~divider: option<React.element>=?,
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
    ~transition=?,
    ~transitionProperty=?,
    ~transitionDelay=?,
    ~transitionDuration=?,
    ~transitionTimingFunction=?,
    ~transitions=?,
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
      className={`${LocalStyles.createStack(~direction?, ())} ${className}`}
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
      ?transition
      ?transitionProperty
      ?transitionDelay
      ?transitionDuration
      ?transitionTimingFunction
      ?transitions
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
      ?onTransitionEnd>
      {switch (children, divider) {
      | (None, None) => React.null
      | (Some(children), None) => children
      | (None, Some(divider)) => divider
      | (Some(children), Some(divider)) => renderWithDivider(children, divider)
      }}
    </Base>
  }
}
