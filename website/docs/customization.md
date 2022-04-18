---
sidebar_position: 3
---

# Customization

Ancestor take advantage of [Module Functors](https://rescript-lang.org/docs/manual/v8.0.0/module#module-functions-functors) for customization of breakpoints, spacing, radius, etc.

## Default setup

The customization interface has the following type signature:

```rescript
module type AncestorCoreMaker = {
  type breakpoints<'value>

  let spacing: float
  let radius: float
  let sizeByBreakpoints: breakpoints<'value> => int
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let css: string => string
}
```

And the default setup has the following values and types:

```rescript

module DefaultConfig = {
  type breakpoints<'a> = [
    | #xs('a)
    | #sm('a)
    | #md('a)
    | #lg('a)
    | #xl('a)
  ]

  let spacing = 8.0
  
  let radius = 8.0

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
Instead of write `display=[#xxs(#flex)]` you can write `display=[xxs(#flex)]`. In some cases, it improves the code readability.
:::

## Spacing
By default, Ancestor uses a scale factor of `8px` to keep the spacing consistent between the elements.
You can customize the scale factor by providing a new value for the `spacing` property:

```rescript

module AncestorCustom = Ancestor.Make({
  include Ancestor.DefaultConfig

  let spacing = 6.0
})

```

## Border Radius
By default, Ancestor uses a scale factor of `8px` to keep the border radius consistent between the elements.
You can customize the scale factor by providing a new value for the `radius` property:

```rescript

module AncestorCustom = Ancestor.Make({
  include Ancestor.DefaultConfig

  let radius = 6.0
})

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
