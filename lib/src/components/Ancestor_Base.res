module type AncestorStylesMaker = {
  type breakpoints<'value>

  let spacing: float
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let sizeByBreakpoints: breakpoints<'value> => int
}

module Make = (Maker: Ancestor_Styles.Maker) => {
  module Styles = Ancestor_Styles.Make(Maker)

  @react.component
  let make = (
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
    ~tag: Ancestor_React.tags=#div,
    ~className="",
    ~children,
    ~id=?,
    ~onClick=?,
    ~onSubmit=?,
    ~onChange=?,
    ~dangerouslySetInnerHTML=?,
  ) =>
    Ancestor_React.createElement(
      tag,
      ReactDOM.domProps(
        ~className={
          let responsiveStyles =
            Styles.createResponsiveStyles(
              ~display?,
              ~justifyContent?,
              ~flexDirection?,
              ~alignItems?,
              ~flexBasis?,
              ~flexWrap?,
              ~p?,
              ~py?,
              ~px?,
              ~pt?,
              ~pb?,
              ~pl?,
              ~pr?,
              ~m?,
              ~mx?,
              ~my?,
              ~mt?,
              ~mb?,
              ~ml?,
              ~mr?,
              ~textAlign?,
              ~fontWeight?,
              ~fontSize?,
              ~letterSpacing?,
              ~lineHeight?,
              ~width?,
              ~height?,
              ~minW?,
              ~minH?,
              ~maxW?,
              ~maxH?,
              ~position?,
              ~top?,
              ~bottom?,
              ~left?,
              ~right?,
              ~zIndex?,
              ~boxSizing?,
              (),
            )->Maker.css

          `${className} ${responsiveStyles}`
        },
        ~id?,
        ~onClick?,
        ~onSubmit?,
        ~onChange?,
        ~dangerouslySetInnerHTML?,
        (),
      ),
      children,
    )
}
