import CodeBlock from '@theme/CodeBlock'
import { Wrapper, cleanUpCode } from '../_helpers'
import CustomizatBreakpoints1 from '!!raw-loader!./Customization_Breakpoints1.res'
import CustomizationSpacing1 from '!!raw-loader!./Customization_Spacing1.res'
import CustomizationSpacing2 from '!!raw-loader!./Customization_Spacing2.res'
import CustomizationSpacing3 from '!!raw-loader!./Customization_Spacing3.res'
import CustomizationSpacing4 from '!!raw-loader!./Customization_Spacing4.res'
import CustomizationRadius1 from '!!raw-loader!./Customization_Radius1.res'
import CustomizationColors1 from '!!raw-loader!./Customization_Colors1.res'
import CustomizationZIndex1 from '!!raw-loader!./Customization_ZIndex1.res'

# Customization

Ancestor take advantage of [Module Functors](https://rescript-lang.org/docs/manual/v8.0.0/module#module-functions-functors) for customization of breakpoints, spacing, radius, etc.

## Default setup

The customization interface has the following type signature:

```rescript title="Ancestor_Config.res"
module type T = {
  type breakpoints<'value>
  type spacing
  type radius
  type colors
  type zIndex

  let spacing: spacing => Ancestor_Css.Length.t
  let radius: radius => Ancestor_Css.Length.t
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let sizeByBreakpoints: breakpoints<'value> => int
  let css: string => string
}
```

And the default setup has the following values and types:

```rescript
module DefaultConfig = {
  type breakpoints<'a> = [#xs('a) | #sm('a) | #md('a) | #lg('a) | #xl('a)]
  let sizeByBreakpoints = values =>
    switch values {
    | #xs(_) => 0
    | #sm(_) => 475
    | #md(_) => 920
    | #lg(_) => 1280
    | #xl(_) => 1920
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #xs(v) => v
    | #sm(v) => v
    | #md(v) => v
    | #lg(v) => v
    | #xl(v) => v
    }

  type colors = Ancestor_Css.Color.t
  let colors = v => v

  type spacing = int
  let spacing = spacing => #px(spacing * 8)

  type radius = int
  let radius = radius => #px(radius * 8)

  type zIndex = int
  let zIndex = v => v

  let css = Ancestor_Emotion.css
}
```

## Breakpoints

### Default breakpoints

Ancestor's breakpoints are customizable. The default setup has the following values:

- `xs` 0px → 475px
- `sm` 475px → 920px
- `md` 920px → 1280px 
- `lg` 1280px → 1440px
- `xl` 1440px

### Custom breakpoints 

If you wish, you can customize **only** the breakpoints by overriding all types and values from the default setup:

<CodeBlock className="language-rescript"> {CustomizatBreakpoints1}</CodeBlock>

Beyond the type definition, you need to define two functions:

#### `sizeByBreakpoints`
  - Type: `let sizeByBreakpoints: breakpoints<'value> => int`
  - Description: A function that receives a `breakpoint<'value>` and returns an integer (the breakpoint value in `px`).


#### `unboxBreakpointValue`
  - Type: `let unboxBreakpointValue: breakpoints<'value> => 'value` 
  - Description: A function that receives a `breakpoint<'value>`, "unbox" and returns its value.

:::important
All Ancestor's components properties are an **array** of **breakpoints**.  If you want a property with the same value in all breakpoints, you need to provide the value for the lowest breakpoint.
:::

:::tip
If you wish, you can create **"aliases functions"** to replace the variants that you defined in your custom setup. 
Instead of write `display=[#xs(#flex)]` you can write `display=[xs(#flex)]`. In some cases, it improves the code readability.
:::

## Spacing
The `spacing` api is fully customizable. By default, Ancestor uses `int` and a scale factor of `8px` to keep the spacing consistent between the elements.
You can customize the scale factor by providing a new value for the `spacing` function:

<CodeBlock className="language-rescript"> {CustomizationSpacing1}</CodeBlock>

### Customizing the type of `spacing` props
You can also customize the type of the spacing properties. This feature is very useful when you need to use scale values like `1.25`, `2.5`, etc. Let's see how to use `float` instead of int:
<CodeBlock className="language-rescript"> {CustomizationSpacing2}</CodeBlock>

### Using design tokens
We can also define a set of spacing tokens using polymorphic variants. Sometimes the design team doesn't use scale values like `1` or `1.5`, but they define a set of design tokens that represents a value in `px`. Let's see how to do this with Ancestor:
<CodeBlock className="language-rescript"> {CustomizationSpacing3}</CodeBlock>

### Using CSS units
Sometimes, you just want to use CSS units like `rem` or `px`:
<CodeBlock className="language-rescript"> {CustomizationSpacing4}</CodeBlock>

## Border Radius
All of those customizations above, also works for the radius. You need just to replace the `spacing` type and value by `radius`. Let's see:
<CodeBlock className="language-rescript"> {CustomizationRadius1}</CodeBlock>

## Colors
By default, Ancestor uses `Ancestor_Css.Color.t` as the type definition for the colors, which means that you're able to use
css colors like `#hex(...)` or `rgb(...)`. However, sometimes you have a well defined set of colors that you're going to use in your components.
Let's see how to combine Ancestor and polyvariants to create type safe custom design tokens:
<CodeBlock className="language-rescript"> {CustomizationColors1}</CodeBlock>

## ZIndex
By default, Ancestor uses `int` as the type definition for the `z-index`.
Managing `z-index` might become difficult sometimes. Here's an example of how combine Ancestor and polyvariants to create type safe tokens for zIndex:
<CodeBlock className="language-rescript"> {CustomizationZIndex1}</CodeBlock>

## CSS in JS
To generate styles Ancestor uses [@emotion/css](https://emotion.sh/docs/introduction).
If you wish, you can use another CSS in JS library that provides an equivalent function, like [Goober](https://github.com/cristianbote/goober#csstaggedtemplate)
or [styled-components](https://styled-components.com/docs/api#css).

```rescript

module Goober = {
  @module("goober") external css: string => string = "css"
}

module AncestorCustom = Ancestor.Make({
  include Ancestor.DefaultConfig

  let css = Goober.css
})
```
