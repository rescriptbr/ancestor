module Make = (Maker: Ancestor_StylesMaker.T) => {
  module Styles = Ancestor_Styles.Make(Maker)
  module Base = Ancestor_Base.Make(Maker)

  type columns = [
    | #1
    | #2
    | #3
    | #4
    | #5
    | #6
    | #7
    | #8
    | #9
    | #10
    | #11
    | #12
  ]

  %%private(
    let basisFromFloat = (value: columns) =>
      (value :> int)
      ->Js.Int.toFloat
      ->(v => v *. 100.0 /. 12.0)
      ->Js.Float.toFixedWithPrecision(~digits=1) ++ "%"

    let createBox = (styles, value) =>
      Styles.mediaQuery(
        styles,
        value,
        `flex-basis: ${value->Maker.unboxBreakpointValue->basisFromFloat}`,
      )

    let sortValues = values =>
      values->Js.Array2.sortInPlaceWith(Styles.sortBySize)->Belt.Array.reduce("", createBox)
  )

  @react.component
  let make = (
    ~className="",
    ~columns: option<Styles.responsiveProp<columns>>=?,
    ~borderRadius=?,
    ~border=?,
    ~borderRight=?,
    ~borderLeft=?,
    ~borderTop=?,
    ~borderBottom=?,
    ~bgColor=?,
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
    // DOM Props
    ~children=?,
    ~tag: Ancestor_React.tags=#div,
    ~id=?,
    ~onClick=?,
    ~onSubmit=?,
    ~onChange=?,
    ~src=?,
    ~alt=?,
    ~dangerouslySetInnerHTML=?,
  ) => {
    <Base
      className={
        let boxClassName =
          columns->Belt.Option.map(sortValues)->Belt.Option.getWithDefault("")->Maker.css
        `${boxClassName} ${className}`
      }
      ?borderRadius
      ?border
      ?borderRight
      ?borderLeft
      ?borderTop
      ?borderBottom
      ?bgColor
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
      tag
      ?id
      ?onSubmit
      ?onClick
      ?onChange
      ?dangerouslySetInnerHTML
      ?src
      ?alt
      ?children
    />
  }
}
