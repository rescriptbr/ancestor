---
sidebar_position: 1
---

# Introduction

**Ancestor** is a suite of components that works as layout primitives to develop high-quality 
projects, design systems, and style guides focused on responsiveness.

## What and Why?
Every front-end project that is using libraries based on components like [React](https://reactjs.org), faces the same situation: 
**Choose or develop a UI library to develop the interfaces.**

In some cases, you can use libraries like [Chakra UI](https://chakra-ui.com/), [Material UI](https://material-ui.com/pt/), or
[Ant Design](https://material-ui.com/pt/) that delivers a set of styled components (grids, buttons, inputs, selects, etc) 
and a lot of other utility functions and components for your project.

However, in some cases, the team needs to create its own design system or style guide with a design language, colors, fonts, buttons, inputs
and other specifications created by a design team. In this case, the usage of a library like Material UI or Chakra UI might 
not be the best choice, because depends on a lot of customizations or changes to adapt the library to the design specification.

It was the reason that we created Ancestor: **to act as a foundation for your project or design system.**

## Features

### Unstyled 💀

Different from popular libraries like Material UI, we don't deliver styled components with colors, fonts, borders, etc. 
All Ancestor's components are **layout primitives** with support to a lot of CSS properties like padding, margin, height, width, etc.

### Responsiveness 💡
All properties from Ancestor's components are responsive, which makes it easy to develop interfaces that need to support multiple devices. 
Through the **breakpoints** defined by the library, you can change the appearance of a component in a specific device or screen size.

### Consistent design 🎨
We don't deliver styled components, but we care about design consistency, especially when dealing with spacing, borders, etc.

### Customizable ⚙️

All properties from Ancestor's components and parameters are customizable: 
Breakpoints, spacing, radius, grid columns, etc which makes it easy to customize and adapt Ancestor to your design system or style guide.

## Basic usage

```ocaml
open Ancestor.Default

@react.component
let make = () => {
  <Grid height=[xxs(100.0->#pct)]>
    <Box
      flexDirection=[xxs(#column), md(#row)]
      p=[xxs(6), md(12), lg(8)]
      position=[xxs(#relative)]
      columns=[xxs(#12), md(#6)]
    >
      <Box
        flexGrow=[xxs(#number(1.0))]
        width=[xxs(15.0->#rem), md(20.0->#rem)]
      >
        <Logo />
      </Box>
      <Box flexGrow=[xxs(#number(3.0))] pt=[xxs(4)]>
        <h1>
          {"A place to share knowledge"->React.string}
        </h1>
        <p>
          {"Where good ideas find you."->React.string}
        </p>
      </Box>
      <Box
        position=[xxs(#absolute)]
        bottom=[xxs(-5.0->#rem)]
        left=[xxs(-5.0->#rem)]
      >
          ....
      </Box>
    </Box>
  </Grid>
}

```

_ Example from [ReScript Conduit](https://github.com/rescriptbr/rescript-conduit/blob/master/src/pages/Signin/Signin.res)_
