module Make = (Maker: Ancestor_Styles.Maker) => {
  module Styles = Ancestor_Styles.Make(Maker)
  module Base = Ancestor_Base.Make(Maker)

  type columnSize = [
    | #auto
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
    let columnToFloat = (value: columnSize) =>
      switch value {
      | #1 => 1.0
      | #2 => 2.0
      | #3 => 3.0
      | #4 => 4.0
      | #5 => 5.0
      | #6 => 6.0
      | #7 => 7.0
      | #8 => 8.0
      | #9 => 9.0
      | #10 => 10.0
      | #11 => 11.0
      | #12 => 12.0
      | _ => 12.0
      }

    let basisFromFloat = value =>
      value
      ->columnToFloat
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
    ~columns: option<Styles.responsiveProp<columnSize>>=?,
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
    ~children,
    ~tag: Ancestor_React.tags=#div,
    ~id=?,
    ~onClick=?,
    ~onSubmit=?,
    ~onChange=?,
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
      tag
      ?id
      ?onClick
      ?onSubmit
      ?onChange
      ?dangerouslySetInnerHTML>
      children
    </Base>
  }
}
