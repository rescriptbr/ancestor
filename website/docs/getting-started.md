---
sidebar_position: 2
---

# Getting started

Step by step to install Ancestor in your project.

:::important
This project assumes that you have a functional project with ReScript and React. Check out [how to create a ReScript project with React](https://rescript-lang.org/docs/react/latest/installation).
:::

## Installation

First off, install **Ancestor** using npm/yarn:

```sh title="Terminal"
yarn add @rescriptbr/ancestor
```

If you want to use the default setup, you need to install [Emotion](https://emotion.sh).

```sh title="Terminal"
yarn add @emotion/css
```

Add the package to `bs-dependencies` in your `bsconfig.json`:

```json title="bsconfig.json"
{
 ...
"bs-dependencies": [
  "@rescript/react",
  "@rescriptbr/ancestor"
 ]
}

```

## Basic usage

Ancestor comes with a default setup. You can use the default setup by exposing the module writing `open Ancestor.Default`:

```rescript title="App.res"
open Ancestor.Default

@react.component
let make = () => {
  <Grid>
    <Box
      columns=[#xs(#12), #md(#6), #lg(#4)]
      display=[#xs(#flex)]
      alignItems=[#xs(#center)]
      px=[#xs(8), #md(12)]
      mt=[#xs(12)]
    >
      {React.string("Hello")}
    </Box>

    <Box
      columns=[#xs(#12), #md(#6), #lg(#4)]
      display=[#xs(#flex)]
      alignItems=[#xs(#center)]
      py=[#xs(6), #md(8)]
      m=[#xs(12)]
    >
      {React.string("World")}
    </Box>
  </Grid>
}
```

:::important
If you wish, you can customize the default setup by following the **[instructions of customization](/docs/customization)**.
:::

