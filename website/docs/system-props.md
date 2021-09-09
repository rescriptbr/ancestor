---
title: System props
sidebar_position: 5
---

# System props

This page list all utility props of all Ancestor's components like `Base` or `Box`.

## API

:::caution
We don't support all CSS props yet. It's still working progress.
:::


Since all Ancestor's utility props are responsive, they are typed as `responsiveProp<'value>`. 
If you want to understand more, see the following example:

```reason title=Ancestor_Styles.res
  type responsiveProp = array<breakpoints<'a>>
```
_Check out the module [Ancestor_Styles.res](https://github.com/rescriptbr/ancestor/blob/master/lib/src/core/Ancestor_Styles.res#L15)_.

The breakpoint type is customizable (check out the [customization section](/docs/customization)), by default it has the following type signature:

```reason 
  type breakpoint<'a> = [#xs('value') | #md('a) | #lg('a) | #xl('a)]
```

Now, see a type signature of a component property:

```reason title=Ancestor_Base.res
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

```reason title=App.res
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
Check out the [`Spacing.t`](/docs/system-props#spacingt) type signature.
:::

#### `p`

- CSS Key: `padding`
- Type: `responsiveProp<Spacing.t>`
- Optional: `true`

#### `px`

- CSS Key: `padding-left`, `padding-right`
- Type: `responsiveProp<Spacing.t>`

#### `py`

- CSS Key: `padding-top`, `padding-bottom`
- Type: `responsiveProp<Spacing.t>`

#### `m`

- CSS Key: `padding`
- Type: `responsiveProp<Spacing.t>`

#### `mx`

- CSS Key: `margin-left`, `margin-right`
- Type: `responsiveProp<Spacing.t>`

#### `my`

- CSS Key: `margin-top`, `margin-bottom`
- Type: `responsiveProp<Spacing.t>`

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
- Type: 

#### `justifySelf`
- CSS Key: `justify-self`
- Type: 

#### `flexFlow`
- CSS Key: `flex-flow`
- Type: 

### Border

#### `borderRadius`
- CSS Key: `border`
- Type: `responsiveProp<int>`

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

:::important
Check out the [`Border.t`](/docs/system-props#lengtht) type signature.
:::

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
- CSS Key: `top`
- Type: `responsiveProp<Length.t>`
 
#### `left`
- CSS Key: `top`
- Type: `responsiveProp<Length.t>`
 
#### `right`
- CSS Key: `top`
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

#### `textDecorationStyle`
- CSS Key: `text-decoration-style`
- Type: `responsiveProp<[#solid | #double | #dotted | #dashed | #wavy]>`

## Types reference

### `Spacing.t`

This type is just an alias for `int` and is used by props like `py`, `my`, `mx`, etc.

```reason
  type t = int
```
Since the type is just an alias, the value will be calculated using the scale factor defined [here](/docs/customization#spacing).

### `Length.t`
Used by props like `width`, `height`, `line-height`, etc:
```reason
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
  ]
```

### `Border.t`

Used by props like `border`, `borderTop`, etc:
```reason
  type style = [
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

  type t = (Length.t, style, Color.t)
```

### `Color.t`
Used by props like `border`, `bgColor`, `color`, etc:
```reason
  type t = [
    | #rgb(int, int, int)
    | #hex(string)
    | #transparent
    | #currentColor
  ]
```


