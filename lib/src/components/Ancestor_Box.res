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
    // Box props
    ~className="",
    ~columns: option<Styles.columnSize>=?,
    // Base Props
    // Flex
    ~display=?,
    ~justifyContent=?,
    ~flexDirection=?,
    ~alignItems=?,
    ~flexBasis=?,
    ~flexWrap=?,
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
    ~textAlign=?,
    ~fontWeight=?,
    ~fontSize=?,
    ~letterSpacing=?,
    ~lineHeight=?,
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
    ~children,
    ~tag: Ancestor_React.tags=#div,
    // Dom Props
    ~id=?,
    ~onClick=?,
    ~onSubmit=?,
    ~onChange=?,
    // React
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
