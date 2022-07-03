module Make = (Maker: Ancestor_StylesMaker.T) => {
  module Styles = Ancestor_Styles.Make(Maker)
  module Base = Ancestor_Base.Make(Maker)

  type direction = [
    | #vertical
    | #horizontal
  ]

  /**
   * Specific styles for the API.
   */
  let createStack = (~direction=?, ~spacing=?, ()) => {
    let baseStyles = `
      display: flex;
    `

    let responsiveStyles = [
      Styles.createResponsiveProp(~prop=spacing, spacing =>
        `gap: ${Styles.Spacing.make(spacing)};`
      ),
      Styles.createResponsiveProp(
        ~prop=direction,
        ~defaultStyles=`flex-direction: row;`,
        direction =>
          switch direction {
          | #vertical => "flex-direction: row;"
          | #horizontal => "flex-direction: column"
          },
      ),
    ]

    Maker.css(
      `
      ${baseStyles}
      ${responsiveStyles->Styles.merge}
      `,
    )
  }

  let renderWithDivider = (children, divider) => {
    let total = React.Children.count(children)
    children->React.Children.mapWithIndex((element, index) => {
      if index == total - 1 {
        element
      } else {
        <> element divider </>
      }
    })
  }

  @react.component
  let make = (
    // Stack props
    ~direction: option<Styles.responsiveProp<direction>>=?,
    ~spacing: option<Styles.responsiveProp<Styles.Spacing.t>>=?,
    ~divider: option<React.element>=?,
    // System props
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
  ) => {
    <Base
      className={`${createStack(~direction?, ~spacing?, ())} ${className}`}
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
      ?onEncrypetd
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
