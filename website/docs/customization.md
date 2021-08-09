---
sidebar_position: 3
---

# Customization

O Ancestor abusa dos [Module Functors](https://rescript-lang.org/docs/manual/v8.0.0/module#module-functions-functors)
para customização de breakpoints, espaçamento e outras propriedades.

## Default setup

A interface de customização do Ancestor tem a seguinte assinatura:

```ocaml
module type AncestorCoreMaker = {
  type breakpoints<'value>

  let spacing: float
  let sizeByBreakpoints: breakpoints<'value> => int
  let unboxBreakpointValue: breakpoints<'value> => 'value
  let css: string => string
}
```

Já os valores da configuração padrão tem os seguintes valores e tipos:

```ocaml

module DefaultConfig = {
  type breakpoints<'a> = [
    | #xxs('a)
    | #xs('a)
    | #sm('a)
    | #md('a)
    | #lg('a)
    | #xl('a)
  ]

  let spacing = 8.0

  let sizeByBreakpoints = values =>
    switch values {
    | #xxs(_) => 0
    | #xs(_) => 375
    | #sm(_) => 600
    | #md(_) => 920
    | #lg(_) => 1280
    | #xl(_) => 1920
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #xxs(v) => v
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

Os breakpoints do Ancestor são customizáveis, por padrão a biblioteca conta com os seguintes breakpoints:

- `#xxs` → 0px
- `#xs` → 375px
- `#sm` → 600px
- `#md` → 920px
- `#lg` → 1280px
- `#xl` → 1920px

Se você quer customizar somente os valores dos breakpoints, você pode utilizar o módulo `DefaultConfig` e sobreescrever os tipos e funções
relacionados aos breakpoints.

```reason
// YourAncestorConfig.res

module AncestorCustom = Ancestor.Make({
  type breakpoints<'value> = [
    | #small('value)
    | #medium('value)
    | #large('value)
  ]

  let sizeByBreakpoints = values =>
    switch values {
    | #small(_) => 600
    | #medium(_) => 920
    | #large(_) => 1280
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #small(v) => v
    | #medium(v) => v
    | #large(v) => v
    }

  let spacing = Ancestor.DefaultConfig.spacing
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

Como você pode ver, além da definição de tipo dos breakpoints, você precisa definir algumas funções auxiliares, sendo elas:

- `let sizeByBreakpoints: breakpoints<'value> => int` - Função que retorna o valor em `px` para cada breakpoint definido.

- `let unboxBreakpointValue: breakpoints<'value> => 'value` - Função que faz o "unbox" do valor para cada breakpoint definido.

## Spacing

Por padrão o Ancestor utiliza um fator de escala de `8px` manter o espaçamento consistente entre os componentes.
Você pode customizar o fator de escala através da propriedade `spacing`:

```ocaml

module AncestorCustom = Ancestor.Make({
  include Ancestor.DefaultConfig

  let spacing = 6.0
})

```

## CSS in JS

Para geração de estilos o Ancestor utiliza o pacote [@emotion/css](https://emotion.sh/docs/introduction). Se preferir, você pode usar
outra biblioteca que forneça uma função equivalente, como [Goober](https://github.com/cristianbote/goober#csstaggedtemplate)
ou [styled-components](https://styled-components.com/docs/api#css).
Exemplo de um setup customizado do Ancestor utilizando o Goober:

```ocaml

module Goober = {
  @module("goober") external css: string => string = "css"
}

module AncestorCustom = Ancestor.Make({
  include Ancestor.DefaultConfig

  let css = Goober.css
})

module App = {
  open AncestorCustom

  @react.component
  let make = () => {
    <Box width=[#xxs(100.0->#rem)]> ... </Box>
  }
}
```
