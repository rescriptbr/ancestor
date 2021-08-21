module Make = (Maker: Ancestor_Styles.Maker) => {
  module Styles = Ancestor_Styles.Make(Maker)
  module Base = Ancestor_Base.Make(Maker)

  %%private(
    let createBox = (styles, value) =>
      Styles.mediaQuery(
        styles,
        value,
        `flex-basis: ${value->Maker.unboxBreakpointValue->Styles.basisFromFloat}`,
      )

    let sortValues = values =>
      values->Js.Array2.sortInPlaceWith(Styles.sortBySize)->Belt.Array.reduce("", createBox)
  )

  @react.component
  let make = (
    ~className="",
    ~columns: option<Styles.columnSize>=?,
    ~display=?,
    ~justifyContent=?,
    ~flexDirection=?,
    ~alignItems=?,
    ~flexBasis=?,
    ~flexWrap=?,
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
      ?display
      ?justifyContent
      ?flexDirection
      ?alignItems
      ?flexBasis
      ?flexWrap
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
