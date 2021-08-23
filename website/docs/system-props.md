---
title: System props
sidebar_position: 5
---

# System props

Essa página lista todas as props utilitárias do componente `Base` e que são herdadas pelos componentes `Box`.

## API

Todas as props utilitárias do Ancestor são responsivas, logo todas são do tipo `Ancestor.Styles.values<'a>`. 
Para entender melhor o sistema de props responsivas, observe o exemplo abaixo com a propriedade `display`:
```reason title=Ancestor_Styles.res
  type responsiveProp = array<breakpoints<'a>>
```

_Veja o módulo [Ancestor_Styles.res](https://github.com/rescriptbr/ancestor/blob/master/lib/src/core/Ancestor_Styles.res#L15)_ para saber mais.

```reason title=Ancestor_Base.res
  module Base = {
    @react.component
    let make = (
      ~display: option<Ancestor_Styles.responsiveProp<[#flex | #block]>>=?,
      // Other props
    ) => // ...
  }
```

_Veja o módulo [Ancestor_Styles.res](https://github.com/rescriptbr/ancestor/blob/master/lib/src/core/Ancestor_Base.res)_ para saber mais.

```reason title=App.res
  open Ancestor.Default

  <Base display=[#xxs(#flex)]>
    ...
  </Base>

```
:::important
Todas as props utilitárias são opcionais.
:::

## Types

### `size`
Used for spacing, width, height and all CSS properties related to sizing.

```reason
  type size = values<
    [
      | #pct(float)
      | #px(float)
      | #rem(float)
      | #em(float)
    ],
  >
```

## Spacing 

### `p`

- CSS Key: `padding`
- Type: `values<int>`
- Optional: `true`

### `px`

- CSS Key: `padding-left`, `padding-right`
- Type: `values<int>`
-
### `py`

- CSS Key: `padding-top`, `padding-bottom`
- Type: `values<int>`

### `m`

- CSS Key: `padding`
- Type: `values<int>`

### `mx`

- CSS Key: `margin-left`, `margin-right`
- Type: `values<int>`

### `my`

- CSS Key: `margin-top`, `margin-bottom`
- Type: `values<int>`

## Flex 

:::caution
Flexbox support is partial and work in progress.
:::

### `justifyContent`
- CSS Key: `justify-content`
- Type: `values< [ | #initial | #"space-between" | #center | #"flex-start" | #"flex-end" | #"space-around" | #"space-evenly" | #start | #end | #left | #right | #revert | #unset ]>`

### `alignItems` 

- CSS Key: `align-items`
- Type: `values< [| #initial | #center | #start | #end | #"flex-start" | #"flex-end" | #"self-start" | #"self-end" ]>`

### `flexDirection`
- CSS Key: `flex-direction`
- Type: `values<[ | #row | #"row-reverse" | #column | #"column-reverse" | #inherit | #initial | #unset ]>`

### `flexValue`
- CSS Key: `flex-value`
- Type: `values<[ | #inherit | #initial | #revert | #unset | #number(float) ]>`

### `flex-grow`
- CSS Key: `flex-grow`
- Type: `values<[ | #inherit | #initial | #revert | #unset | #number(float) ]>`

### `flex-shrink`
- CSS Key: `flex-shrink`
- Type: `values<[ | #inherit | #initial | #revert | #unset | #number(float) ]>`

### `order`
- CSS Key: `order`
- Type: `values<[ | #inherit | #initial | #revert | #unset | #number(float) ]>`

### `flex-wrap`
- CSS Key: `flex-wrap`
- Type: `values<[ | #nowrap | #wrap | #"wrap-reverse" | #inherit | #initial | #unset ]>`

## Size

### `width`
- CSS Key: `width`
- Type: `values<size>`

### `height`
- CSS Key: `height`
- Type: `values<size>`

### `maxW`
- CSS Key: `max-width`
- Type: `values<size>`

### `minW`
- CSS Key: `min-width`
- Type: `values<size>`

### `maxH`
- CSS Key: `max-width`
- Type: `values<size>`

### `minH`
- CSS Key: `min-width`
- Type: `values<size>`

:::important
Check it out the [`size`](/docs/system-props#size) type signature.
:::

## Texts

:::caution
All CSS properties related do texts and font manipulation are partial supported.
:::


### `textAlign`
- CSS Key: `text-align`
- Type: `values<[#center | #left | #right]>`


### `letterSpacing`
- CSS Key: `letter-spacing`
- Type: `values<size>`

### `lineHeight`
- CSS Key: `line-height`
- Type: `values<size>`

## Position & Placement

### `position`
-  CSS Key: `position`
-  Type: `values<[ | #static | #relative | #absolute | #fixed | #sticky ]>`

### `top`
- CSS Key: `top`
- Type: `values<size>`

### `bottom`
- CSS Key: `top`
- Type: `values<size>`
 
### `left`
- CSS Key: `top`
- Type: `values<size>`
 
### `right`
- CSS Key: `top`
- Type: `values<size>`

### `zIndex`
- CSS Key: `z-index`
- Type: `values<int>`

## Other props

### `display`
- CSS Key: `display`
- Type: `values<[| #none | #inline | #block | #"list-item" | #"inline-block" | #"inline-table" | #table | #"table-cell" | #"table-column" | #"table-column-group" | #"table-footer-group" | #"table-header-group" | #"table-row" | #"table-row-group" | #flex| #"inline-flex" | #grid | #"inline-grid" | #"run-in" | #inherit]>`
-
### `boxSizing`
- CSS Key: `box-sizing`
- Type: `values<[| #"content-box" | #"border-box" | #initial | #inherit ]>`

