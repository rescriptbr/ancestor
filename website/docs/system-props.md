---
title: System props
---

# System props

This page list all utility props of all Ancestor's components like `Base` or `Box`.

## API

:::caution
We don't support all CSS props yet. It's still work in progress.
:::


Since all Ancestor's utility props are responsive, they are typed as `responsiveProp<'value>`. 
If you want to understand more, see the following example:

```rescript title=Ancestor_Styles.res
  type responsiveProp = array<breakpoints<'a>>
```
> :bulb: Check out the module [Ancestor_Styles.res](https://github.com/rescriptbr/ancestor/blob/master/lib/src/core/Ancestor_Styles.res#L15).

The breakpoint type is customizable (check out the [customization section](/docs/customization)), by default it has the following type signature:

```rescript 
  type breakpoint<'a> = [#xs('value') | #md('a) | #lg('a) | #xl('a)]
```

Now, see a type signature of a component property:

```rescript title=Ancestor_Base.res
  module Base = {
    @react.component
    let make = (
      ~display: option<Ancestor_Styles.responsiveProp<[#flex | #block]>>=?,
      // Other props
    ) => // ...
  }
```

_Check out the module [Ancestor_Base.res](https://github.com/rescriptbr/ancestor/blob/master/lib/src/core/Ancestor_Base.res)_.

Example of usage: 

```rescript title=App.res
  open Ancestor.Default

  <Base display=[#xs(#flex)]>
    ...
  </Base>

```
:::important
All utility props are optional.
:::

### Properties reference

### Spacing 

:::important
Check out the [`Config.spacing`](/docs/system-props#configspacing) type signature.
:::

#### `p`

- CSS Key: `padding`
- Type: `responsiveProp<Config.spacing>`

#### `px`

- CSS Key: `padding-left`, `padding-right`
- Type: `responsiveProp<Config.spacing>`

#### `py`

- CSS Key: `padding-top`, `padding-bottom`
- Type: `responsiveProp<Config.spacing>`

#### `m`

- CSS Key: `margin`
- Type: `responsiveProp<Config.spacing>`

#### `mx`

- CSS Key: `margin-left`, `margin-right`
- Type: `responsiveProp<Config.spacing>`

#### `my`

- CSS Key: `margin-top`, `margin-bottom`
- Type: `responsiveProp<Config.spacing>`

### Flex 

#### `justifyContent`
- CSS Key: `justify-content`
- Type: `responsiveProp<[` 
  - `| #initial `
  - `| #"space-between" `
  - `| #center `
  - `| #"flex-start" `
  - `| #"flex-end" `
  - `| #"space-around" `
  - `| #"space-evenly" `
  - `| #start `
  - `| #end `
  - `| #left `
  - `| #right `
  - `| #revert `
  - `| #unset `

  `]>`

#### `alignItems` 
- CSS Key: `align-items`
- Type: `responsiveProp< [|` 
  - `| #initial `
  - `| #center `
  - `| #start `
  - `| #end `
  - `| #"flex-start" `
  - `| #"flex-end" `
  - `| #"self-start" `
  - `| #"self-end" `
  
  `]>`

#### `flexDirection`
- CSS Key: `flex-direction`
- Type: `responsiveProp<[`
  - `| #row `
  - `| #"row-reverse" `
  - `| #column `
  - `| #"column-reverse" `
  - `| #inherit `
  - `| #initial `
  - `| #unset `
  
  `]>`

#### `flexBasis`
- CSS Key: `flex-basis`
- Type: `responsiveProp<[` 
  - `| #length(Length.t) `
  - `| #auto `
  - `| #fill `
  - `| #content `
  - `| #"max-content" `
  - `| #"min-content" `
  - `| #"fit-content" `

  `]>`

#### `flexWrap`
- CSS Key: `flex-wrap`
- Type: `responsiveProp<[` 
  - `| #nowrap `
  - `| #wrap `
  - `| #"wrap-reverse" `
  - `| #inherit `
  - `| #initial `
  - `| #unset`

  `]>`

#### `flexGrow`
- CSS Key: `flex-grow`
- Type: `responsiveProp<[`
  - `| #num(float) `
  - `| #inherit `
  - `| #initial` 
  - `| #revert `
  - `| #unset `
  
 `]>`

#### `alignContent`
- CSS Key: `align-content`
- Type: `responsiveProp<[` 
  - `| #center `
  - `| #start `
  - `| #end `
  - `| #"flex-end" `
  - `| #normal `
  - `| #baseline `
  - `| #"first-baseline" `
  - `| #"last-baseline" `
  - `| #"space-between" `
  - `| #"space-around" `
  - `| #"space-evenly" `
  - `| #stretch `
  - `| #"safe-center" `
  - `| #"unsafe-center" `
  - `| #inherit `
  - `| #initial `
  - `| #unset `
  - `| #"flex-start" `
  
  `]>`

#### `alignSelf`
- CSS Key: `align-self`
- Type: `AlignContent.t`

#### `justifySelf`
- CSS Key: `justify-self`
- Type: `AlignContent.t`

#### `flexFlow`
- CSS Key: `flex-flow`
- Type: `(FlexDirection.t, FlexWrap.t)`

#### `gap`
- CSS Key: `gap`
- Type: `responsiveProp<[`
 - `| #one(Config.spacing)`
 - `| #two(Config.t, Config.spacing) `
 - `| #inherit`
 - `| #initial`
 - `| #revert`
 - `| #unset`
 
`]>`

### Border

:::important
Check out the [`Config.radius`](/docs/system-props#configradius) type signature.
:::

#### `borderRadius`
- CSS Key: `border`
- Type: `responsiveProp<Config.radius>`

#### `borderTLRadius`
- CSS Key: `border-top-left-radius`
- Type: `responsiveProp<Config.radius>`

#### `borderTRRadius`
- CSS Key: `border-top-right-radius`
- Type: `responsiveProp<Config.radius>`


#### `borderBLRadius`
- CSS Key: `border-bottom-left-radius`
- Type: `responsiveProp<Config.radius>`

#### `borderBRRadius`
- CSS Key: `border-bottom-right-radius`
- Type: `responsiveProp<Config.radius>`

:::important
Check out the [`Border.t`](/docs/system-props#bordert) and [`BordeStyle.t`](/docs/system-props/#borderstylet) type signature.
:::

#### `border`
- CSS Key: `border`
- Type: `responsiveProp<Border.t>`

#### `borderTop`

- CSS Key: `border-top`
- Type: `responsiveProp<Border.t>`

#### `borderBottom`
- CSS Key: `border-bottom`
- Type: `responsiveProp<Border.t>`

#### `borderLeft`
- CSS Key: `border-left`
- Type: `responsiveProp<Border.t>`

#### `borderRight`
- CSS Key: `border-right`
- Type: `responsiveProp<Border.t>`

#### `borderTopStyle`
- CSS Key: `border-top-style`
- Type: `responsiveProp<BorderStyle.t>`

#### `borderBottomStyle`
- CSS Key: `border-bottom-style`
- Type: `responsiveProp<BorderStyle.t>`

#### `borderLeftStyle`
- CSS Key: `border-left-style`
- Type: `responsiveProp<BorderStyle.t>`

#### `borderRightStyle`
- CSS Key: `border-right-style`
- Type: `responsiveProp<BorderStyle.t>`

#### `borderTopWidth`
- CSS Key: `border-top-width`
- Type: `responsiveProp<Length.t>`

#### `borderBottomWidth`
- CSS Key: `border-bottom-width`
- Type: `responsiveProp<Length.t>`

#### `borderLeftWidth`
- CSS Key: `border-left-width`
- Type: `responsiveProp<Length.t>`

#### `borderRightWidth`
- CSS Key: `border-right-width`
- Type: `responsiveProp<Length.t>`

#### `borderTopColor`
- CSS Key: `border-top-color`
- Type: `responsiveProp<Color.t>`

#### `borderBottomColor`
- CSS Key: `border-bottom-color`
- Type: `responsiveProp<Color.t>`

#### `borderLeftColor`
- CSS Key: `border-left-color`
- Type: `responsiveProp<Color.t>`

#### `borderRightColor`
- CSS Key: `border-right-color`
- Type: `responsiveProp<Color.t>`

### Size

#### `width`
- CSS Key: `width`
- Type: `responsiveProp<Length.t>`

#### `height`
- CSS Key: `height`
- Type: `responsiveProp<Length.t>`

#### `maxW`
- CSS Key: `max-width`
- Type: `responsiveProp<Length.t>`

#### `minW`
- CSS Key: `min-width`
- Type: `responsiveProp<Length.t>`

#### `maxH`
- CSS Key: `max-width`
- Type: `responsiveProp<Length.t>`

#### `minH`
- CSS Key: `min-width`
- Type: `responsiveProp<Length.t>`

:::important
Check out the [`Length.t`](/docs/system-props#lengtht) type signature.
:::

### Texts

#### `fontFamily`
- CSS Key: `font-family`
- Type: `responsiveProp<[` 
  - `| #custom(array<string>)`
  - `| #initial`
  - `| #inherit` 
  `]>`



#### `fontWeight`
- CSS Key: `font-weight`
- Type: `responsiveProp<[` 
  - `| #normal `
  - `| #bold `
  - `| #bolder `
  - `| #lighter `
  - `| #100 `
  - `| #200 `
  - `| #300 `
  - `| #400 `
  - `| #500 `
  - `| #600 `
  - `| #700 `
  - `| #800 `
  - `| #900 `
  - `| #initial `
  - `| #inherit` 

  `]>`

#### `textAlign`
- CSS Key: `text-align`
- Type: `responsiveProp<[#center | #left | #right]>`

#### `letterSpacing`
- CSS Key: `letter-spacing`
- Type: `responsiveProp<Length.t>`

#### `lineHeight`
- CSS Key: `line-height`
- Type: `responsiveProp<Length.t>`

### Position & Placement

#### `position`
-  CSS Key: `position`
-  Type: `responsiveProp<[ | #static | #relative | #absolute | #fixed | #sticky ]>`

#### `top`
- CSS Key: `top`
- Type: `responsiveProp<Length.t>`

#### `bottom`
- CSS Key: `bottom`
- Type: `responsiveProp<Length.t>`
 
#### `left`
- CSS Key: `left`
- Type: `responsiveProp<Length.t>`
 
#### `right`
- CSS Key: `right`
- Type: `responsiveProp<Length.t>`

#### `zIndex`
- CSS Key: `z-index`
- Type: `responsiveProp<int>`

### General 

#### `display`
- CSS Key: `display`
- Type: `responsiveProp<[|` 
  - `| #none `
  - `| #inline `
  - `| #block `
  - `| #"list-item" `
  - `| #"inline-block" `
  - `| #"inline-table" `
  - `| #table `
  - `| #"table-cell" `
  - `| #"table-column" `
  - `| #"table-column-group" `
  - `| #"table-footer-group" `
  - `| #"table-header-group" `
  - `| #"table-row" `
  - `| #"table-row-group" `
  - `| #flex`
  - `| #"inline-flex" `
  - `| #grid `
  - `| #"inline-grid" `
  - `| #"run-in" `
  - `| #inherit`

  `]>`

#### `boxSizing`
- CSS Key: `box-sizing`
- Type: `responsiveProp<[| #"content-box" | #"border-box" | #initial | #inherit ]>`

#### `color`
- CSS Key: `color`
- Type: `responsiveProp<Color.t>`

#### `bgColor`
- CSS Key: `background-color`
- Type: `responsiveProp<Color.t>`

#### `bgSize`
- CSS Key: `background-size`
- Type: `responsiveProp<[`
   - `| #cover` 
   - `| #contain`
   - `| #inherit`
   - `| #initial`
   - `| #unset`
   - `| #auto`
   - `| #length(Length.t)`

`]>`

#### `bgPosition`
- CSS Key: `background-position`
- Type: `responsiveProp<[`
   -`| #top`
   -`| #bottom`
   -`| #left`
   -`| #right`
   -`| #center`
   -`| #inherit`
   -`| #initial`
   -`| #unset`
   -`| #length(Length.t)`

`]>`

#### `bgImage`
- CSS Key: `background-image`
- Type: `responsiveProp<[`
   -`| #url(string)`
   -`| #initial`
   -`| #inherit`
`]>`




:::important
Check out the [`Color.t`](/docs/system-props#colort) type signature.
:::

#### `overflow`
- CSS Key: `overflow`
- Type: `responsiveProp<[#hidden | #visible | #scroll | #auto]>`

#### `overflowX`
- CSS Key: `overflow-x`
- Type: `responsiveProp<[#hidden | #visible | #scroll | #auto]>`

#### `overflowY`
- CSS Key: `overflow-y`
- Type: `responsiveProp<[#hidden | #visible | #scroll | #auto]>`

#### `cursor`
- CSS Key: `cursor`
- Type: `responsiveProp<[` 
   - ` | #auto`
   - ` | #default`
   - ` | #none`
   - ` | #"context-menu"`
   - ` | #help`
   - ` | #pointer`
   - ` | #progress`
   - ` | #wait`
   - ` | #cell`
   - ` | #crosshair`
   - ` | #text`
   - ` | #"vertical-text"`
   - ` | #alias`
   - ` | #copy`
   - ` | #move`
   - ` | #"no-drop"`
   - ` | #"not-allowed"`
   - ` | #grab`
   - ` | #grabbing`
   - ` | #"all-scroll"`
   - ` | #"col-resize"`
   - ` | #"row-resize"`
   - ` | #"n-resize"`
   - ` | #"e-resize"`
   - ` | #"s-resize"`
   - ` | #"w-resize"`
   - ` | #"ne-resize"`
   - ` | #"nw-resize"`
   - ` | #"se-resize"`
   - ` | #"sw-resize"`
   - ` | #"ew-resize"`
   - ` | #"ns-resize"`
   - ` | #"nesw-resize"`
   - ` | #"nwse-resize"`
   - ` | #"zoom-in"`
   - ` | #"zoom-out"`
  `]>`

#### `visibility`
- CSS Key: `visibility`
- Type: `responsiveProp<[#hidden | #visible | #collapse]>`

#### `listStyleType`
- CSS Key: `list-style-type`
- Type: `responsiveProp<`
    - `| #disc`
    - `| #circle`
    - `| #square`
    - `| #decimal`
    - `| #"lower-alpha"`
    - `| #"upper-alpha"`
    - `| #"lower-greek"`
    - `| #"lower-latin"`
    - `| #"upper-latin"`
    - `| #"lower-roman"`
    - `| #"upper-roman"`
    - `| #none`
  `]>`

#### `listStylePosition`
- CSS Key: `list-style-position`
- Type: `responsiveProp<`
    - `| #inside`
    - `| #outside`

  `]>`

#### `listStyleImage`
- CSS Key: `list-style-image`
- Type: `responsiveProp<`
    - `| #url(string)`

  `]>`

#### `listStyle`
- CSS Key: `list-style`
- Type: `responsiveProp<`
   - `| #"type"(ListStyleType.t)`
   - `| #position(ListStylePosition.t)`
   - `| #image(ListStyleImage.t)`
   - `| #short(ListStyleType.t, ListStylePosition.t, ListStyleImage.t)`
   - `| #inherit`
   - `| #initial`
   - `| #revert`
   - `| #unset`
   - `| #none`

  `]>`

#### `outlineStyle`
- CSS Key: `outline-style`
- Type: `responsiveProp<`
    - `| #none`
    - `| #hidden`
    - `| #dotted`
    - `| #dashed`
    - `| #solid`
    - `| #double`
    - `| #groove`
    - `| #ridge`
    - `| #inset`
    - `| #outset`

  `]>`

#### `outline`
- CSS Key: `outline`
- Type: `responsiveProp<`
  - `| #short(Length.t, OutlineStyle.t, Color.t)`
  - `| #inherit`
  - `| #initial`
  - `| #unset`

  `]>`


#### `textDecorationStyle`
- CSS Key: `text-decoration-style`
- Type: `responsiveProp<[#solid | #double | #dotted | #dashed | #wavy]>`

#### `textDecorationLine`
- CSS Key: `text-decoration-line`
- Type: `responsiveProp<[#none | #underline | #overline | #"line-through" | #blink]>`

#### `textDecoration`
- CSS Key: `text-decoration`
- Type: `responsiveProp<[`
   - `| #short(TextDecorationLine.t, Color.t, TextDecorationStyle.t)`
   - `| #initial`
   - `| #inherit`
   - `| #none`

`]>`


#### `transform`
- CSS Key: `transform`
- Type: `responsiveProp<Transform.t>`

:::important
Check out the [`Transform.t`](/docs/system-props#transformt) type signature.
:::

## Types reference

### `Config.spacing`

The `Config.spacing` type is customizable, check out its [customization section](/docs/customization#spacing). By default, it's typed as an `int`.

```rescript
  type spacing = int
```

### `Config.radius`

The `Config.radius` type is customizable, check out its [customization section](/docs/customization#border-radius). By default, it's typed as an `int`.

```rescript
  type radius = int
```

### `Length.t`
Used by props like `width`, `height`, `line-height`, etc:
```rescript
  type t = [
    | #ch(float)
    | #em(float)
    | #ex(float)
    | #rem(float)
    | #vh(float)
    | #vw(float)
    | #vmin(float)
    | #vmax(float)
    | #px(int)
    | #pxFloat(float)
    | #cm(float)
    | #mm(float)
    | #inch(float)
    | #pc(float)
    | #pt(int)
    | #zero
    | #pct(float)
    | #add(t, t)
    | #sub(t, t)
    | #mult(t, t)
    | #div(t, t)
  ]
```

### Using CSS `calc`
```rescript
  <Box width=[xs(#add(1.6->#rem, 10->#px))]>
    ...
  </Box>
```
The expression `#add(1.6->#rem, 10->#px)` is equivalent to `calc(1.6rem + 10px)` in plain CSS. You can replace `#add` by `#sub`, `#mult` or `#div` to use another calc operator.

### `BorderStyle.t`

Used by props like `borderLeftStyle`, `borderStyle`, etc:
```rescript
  type t = [
    | #none
    | #hidden
    | #dotted
    | #dashed
    | #solid
    | #double
    | #groove
    | #ridge
    | #inset
    | #outset
  ]
```

### `Border.t`

Used by props like `border`, `borderTop`, etc:
```rescript
  type t = (Length.t, BorderStyle.t, Color.t)
```

### `Color.t`
Used by props like `border`, `bgColor`, `color`, etc:
```rescript
  type t = [
    | #rgb(int, int, int)
    | #hex(string)
    | #transparent
    | #currentColor
  ]
```

### `Transform.t`
Used by `transform`:
```rescript
  type t = [
    | #translate(Length.t, Length.t)
    | #translate3d(Length.t, Length.t, Length.t)
    | #translateX(Length.t)
    | #translateY(Length.t)
    | #translateZ(Length.t)
    | #scale(float, float)
    | #scale3d(float, float, float)
    | #scaleX(float)
    | #scaleY(float)
    | #scaleZ(float)
    | #rotate(Angle.t)
    | #rotate3d(float, float, float, Angle.t)
    | #rotateX(Angle.t)
    | #rotateY(Angle.t)
    | #rotateZ(Angle.t)
    | #skew(Angle.t, Angle.t)
    | #skewX(Angle.t)
    | #skewY(Angle.t)
    | #perspective(int)
  ]
  ```
