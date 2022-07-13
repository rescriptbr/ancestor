---
sidebar_position: 3
---

# Customization

Ancestor take advantage of [Module Functors](https://rescript-lang.org/docs/manual/v8.0.0/module#module-functions-functors) for customization of breakpoints, spacing, radius, etc.

## Default setup

The customization interface has the following type signature:

```rescript title="Ancestor_Config.res"
module type T = {
  type breakpoints<'value>
  type spacing
  type radius
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
  type spacing = int
  type radius = int

  let spacing = spacing => #px(spacing * 8)
  let radius = radius => #px(radius * 8)

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

```rescript title="MyApp.res"
module AncestorCustom = Ancestor.Make({
  type spacing = Ancestor.DefaultConfig.spacing
  type radius = Ancestor.DefaultConfig.radius
  type breakpoints<'value> = [
    | #small('value)
    | #medium('value)
    | #large('value)
  ]

  let sizeByBreakpoints = values =>
    switch values {
    | #small(_) => 0 
    | #medium(_) => 600
    | #large(_) => 1280
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #small(v) => v
    | #medium(v) => v
    | #large(v) => v
    }
  
  let spacing = Ancestor.DefaultConfig.spacing
  let radius = Ancestor.DefaultConfig.radius
  let css = Ancestor.DefaultConfig.css
})

module App = {
  open AncestorCustom

  @react.component
  let make = () => {
    <Grid>
      <Box columns=[#small(#12), #medium(#6)]>
        ...
      </Box>
    </Grid>
  }
}

```

How you can see, beyond the type definition, you need to define two functions:

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

```rescript

module AncestorCustom = Ancestor.Make({
  include Ancestor.DefaultConfig

  let spacing = v => #px(v * 4.0) 
})
```
### Customizing the type of `spacing` props
You can also customize the type of the spacing properties. Let's see how to use `float` instead of int:
```rescript 
module AncestorCustom = Ancestor.Make({
  type breakpoints<'value> = Ancestor.DefaultConfig.breakpoints<'value>
  type radius = Ancestor.DefaultConfig.radius
  let radius = Ancestor.DefaultConfig.radius
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type spacing = float
  let spacing = v => #pxFloat(v *. 8.0)
})

@react.component
let make = () => {
  <AncestorCustom.Box m=[#md(2.25)]>
    <AncestorCustom.Box p=[#xs(4.0), #md(3.0)] />
  </AncestorCustom.Box>
}
```
### Using design tokens
We can also define a set of spacing tokens using polymorphic variants:
```rescript
module AncestorCustom = Ancestor.Make({
  type breakpoints<'value> = Ancestor.DefaultConfig.breakpoints<'value>
  type radius = Ancestor.DefaultConfig.radius
  let radius = Ancestor.DefaultConfig.radius
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type spacing = [#xs | #md | #lg]
  let spacing = v =>
    switch v {
    | #xs => #px(8)
    | #md => #px(16)
    | #lg => #px(24)
    }
})

@react.component
let make = () => {
  <AncestorCustom.Box m=[#md(#lg)]>
    <AncestorCustom.Box p=[#xs(#md), #md(#lg)] />
  </AncestorCustom.Box>
}
```
### Using CSS units
Sometimes, you just want to use CSS units like `rem` or `px`:
```rescript
module AncestorCustom = Ancestor.Make({
  type breakpoints<'value> = Ancestor.DefaultConfig.breakpoints<'value>
  type radius = Ancestor.DefaultConfig.radius
  let radius = Ancestor.DefaultConfig.radius
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type spacing = Ancestor_Css.Length.t
  let spacing = v => v
})

@react.component
let make = () => {
  <AncestorCustom.Box m=[#xs(24->#px)]>
    <AncestorCustom.Box p=[#xs(32->#px)] />
  </AncestorCustom.Box>
}
```
## Border Radius
All of those customizations above, also works for the radius. You need just to replace the `spacing` type and value by `radius`. Let's see:
```rescript
module AncestorCustom = Ancestor.Make({
  type breakpoints<'value> = Ancestor.DefaultConfig.breakpoints<'value>
  type spacing = Ancestor.DefaultConfig.spacing
  let spacing = Ancestor.DefaultConfig.spacing
  let unboxBreakpointValue = Ancestor.DefaultConfig.unboxBreakpointValue
  let sizeByBreakpoints = Ancestor.DefaultConfig.sizeByBreakpoints
  let css = Ancestor.DefaultConfig.css

  type radius = Ancestor_Css.Length.t
  let radius = v => v
})

@react.component
let make = () => {
  <AncestorCustom.Box borderRadius=[#xs(24->#px)]>
    <AncestorCustom.Box borderRadius=[#xs(32->#px)] />
  </AncestorCustom.Box>
}
```
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
