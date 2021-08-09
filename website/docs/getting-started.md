---
sidebar_position: 2
---

# Getting started

Passo a passo rápido para instalar e configurar o **Ancestor** no seu projeto.

:::important
 Esse tutorial presume que você tem um setup funcional de um projeto ReScript com React. Se necessário você pode consultar a documentação
 oficial do ReScript como **[criar um projeto ReScript com React](https://rescript-lang.org/docs/react/latest/installation).**
:::

## Installation

O primeiro passo é instalar o **Ancestor** no seu projeto:

```sh title="Terminal"
yarn add @rescriptbr/ancestor
```

Se você for utilizar a configuração padrão do Ancestor, sem customizações, você precisa instalar o [Emotion](https://emotion.sh):

```sh title="Terminal"
yarn add @emotion/css
```

Adicione o pacote ao `bsconfig.json` do seu projeto:

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

O Ancestor vem com uma configuração padrão para você utilizar no seu projeto.

```ocaml title="App.res"
open Ancestor.Default

@react.component
let make = () => {
  <Grid>
    <Box
      columns=[#xxs(#12), #md(#6), #(4)]
      display=[#xxs(#flex)]
      alignItems=[#xxs(#center)]
      px=[#xxs(8), #md(12)]
      mt=[#xxs(12)]
    >
      ...
    </Box>

    <Box
      columns=[#xxs(#12), #md(#6), #(4)]
      display=[#xxs(#flex)]
      alignItems=[#xxs(#center)]
      py=[#xxs(6), #md(8)]
      m=[#xxs(12)]
    >
      ...
    </Box>

  </Grid>
}
```

:::important
Se preferir, você pode customizar o setup padrão seguindo as **[instruções de customização](/docs/customization)**.
:::

