module Make = (Maker: Ancestor_Styles.Maker) => {
  module Base = Ancestor_Base.Make(Maker)

  %%private(
    let grid = Maker.css(`
      width: 100%;
      flex-wrap: wrap;
      display: flex;
  `)
  )

  @react.component
  let make = (
    // Box props
    ~className="",
    // Base Props
    // Flex
    ~display=?,
    ~justifyContent=?,
    ~flexDirection=?,
    ~alignItems=?,
    ~flexGrow=?,
    ~flexShrink=?,
    ~alignSelf=?,
    ~order=?,
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
      className={`${grid} ${className}`}
      ?display
      ?justifyContent
      ?flexDirection
      ?alignItems
      ?flexGrow
      ?flexShrink
      ?alignSelf
      ?order
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
