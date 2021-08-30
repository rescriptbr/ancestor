module Make = (Maker: Ancestor_StylesMaker.T) => {
  module Base = Ancestor_Base.Make(Maker)
  module Styles = Ancestor_Styles.Make(Maker)

  %%private(
    let defaultStyles = Maker.css(`
      width: 100%;
      flex-wrap: wrap;
      display: flex;
    `)

    let createResponsiveStyles = (currentStyles, value) => {
      let spacingInRem = value->Maker.unboxBreakpointValue->Styles.Spacing.make

      Styles.mediaQuery(
        currentStyles,
        value,
        `
          display: flex;
          flex-wrap: wrap;
          width: calc(100% + ${spacingInRem});
          margin-left: -${spacingInRem};
          margin-top: -${spacingInRem};

          > * {
            box-sizing: border-box;
            padding-left: ${spacingInRem};
            padding-top: ${spacingInRem};
          }
          `,
      )
    }

    let grid = (~spacing=?, ()) =>
      spacing
      ->Belt.Option.map(values =>
        values
        ->Js.Array2.sortInPlaceWith(Styles.sortBySize)
        ->Belt.Array.reduce("", createResponsiveStyles)
        ->Maker.css
      )
      ->Belt.Option.getWithDefault(defaultStyles)
  )

  @react.component
  let make = (
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
    ~spacing: option<Styles.responsiveProp<int>>=?,
    ~className="",
    ~children=?,
    ~tag: Ancestor_React.tags=#div,
    ~id=?,
    ~onClick=?,
    ~onSubmit=?,
    ~onChange=?,
    ~dangerouslySetInnerHTML=?,
  ) => {
    <Base
      className={`${grid(~spacing?, ())} ${className}`}
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
      ?dangerouslySetInnerHTML
      ?children
    />
  }
}
