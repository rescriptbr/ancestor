module Make = (Maker: Ancestor_Styles.Maker) => {
  module Base = Ancestor_Base.Make(Maker)
  module Styles = Ancestor_Styles.Make(Maker)

  %%private(
    let defaultStyles = Maker.css(`
      width: 100%;
      flex-wrap: wrap;
      display: flex;
    `)

    let createResponsiveStyles = (currentStyles, value) => {
      let spacingInRem = value->Maker.unboxBreakpointValue->Styles.Spacing.toString

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
    /**
     * Base Props
     */
    // Flex
    ~display=?,
    ~justifyContent=?,
    ~flexDirection=?,
    ~alignItems=?,
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
    /**
     * Grid Props
     */
    ~spacing: option<Styles.responsiveProp<int>>=?,
    ~className="",
    ~children,
    ~tag: Ancestor_React.tags=#div,
    // DOM Props
    ~id=?,
    ~onClick=?,
    ~onSubmit=?,
    ~onChange=?,
    ~dangerouslySetInnerHTML=?,
  ) => {
    <Base
      className={`${grid(~spacing?, ())} ${className}`}
      ?display
      ?justifyContent
      ?flexDirection
      ?alignItems
      // Padding
      ?p
      ?px
      ?py
      ?pt
      ?pb
      ?pl
      ?pr
      //Margin
      ?m
      ?mx
      ?my
      ?mt
      ?mb
      ?ml
      ?mr
      // Sizing
      ?width
      ?height
      ?minW
      ?minH
      ?maxW
      ?maxH
      // Position
      ?position
      ?top
      ?bottom
      ?left
      ?right
      ?zIndex
      // Box sizing
      ?boxSizing
      // Props
      tag
      // Dom Props
      ?id
      ?onClick
      ?onSubmit
      ?onChange
      ?dangerouslySetInnerHTML>
      children
    </Base>
  }
}
