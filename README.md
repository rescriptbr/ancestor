<p align="center">
  <img src="./assets/ancestor-logo.svg" /> 
  <br />
  <br />
  <a target="_blank" href=""> Docs </a> ●
    <a target="_blank" href=""> Getting Started </a> ●
  <a target="_blank" href=""> Examples </a> ●
  <a target="_blank" href="https://github.com/rescripbr"> ReScript Brazil Community </a>
 </p>

## Installation

O primeiro passo é instalar o **Ancestor** no seu projeto:

```sh
yarn add @rescriptbr/ancestor
```

Se você for utilizar a configuração padrão do Ancestor, sem customizações, você precisa instalar o [Emotion](https://emotion.sh):

```sh
yarn add @emotion/css
```

Adicione o pacote ao seu `bsconfig.json`:

```json
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

> Se preferir você pode customizar e/ou modificar a configuração padrão seguindo as [instruções de customização](/docs/customization).

```ocaml
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


## License
MIT
