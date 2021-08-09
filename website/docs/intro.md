---
sidebar_position: 1
---

# Introduction

**Ancestor** é uma suite de componentes que funcionam como primitivas de layout para construção de projetos, design systems e styleguides de alta qualidade com foco em responsividade.

## What and Why?

Todo projeto front-end construido com bibliotecas baseadas em componentes como o [React](https://reactjs.org),
se deparam com a mesma situação: Desenvolver ou escolher uma biblioteca de UI para desenvolvimento das interfaces do projeto.

Em alguns casos você pode optar facilmente por bibliotecas conhecidas como [Chakra UI](https://chakra-ui.com/), [Material UI](https://material-ui.com/pt/) e
[Ant Design](https://material-ui.com/pt/) que possuem uma gama de componentes estilizados (grid, buttons, inputs, selects, etc) e outras funções e componentes utilitários para o seu projeto.

No entanto, é comum que alguns times de produto desenvolvam seu próprio Design System ou Styleguide, com uma linguagem de design, cores, fontes e outras caracteristícas derivadas a partir de um branding do produto que foi feito sob medida para o projeto.

Nesses casos, o uso de uma biblioteca como as citadas acima, nem sempre é a melhor
escolha, pois geralmente, demandam de muitas customizações e mudanças para adequar a biblioteca a linguagem de design criada para o produto em questão.

Foi por esse outros motivos que o **Ancestor** foi criado, para funcionar como uma fundação para seu projeto, design system ou styleguide.

## Features

### Unstyled 💀

Diferente de bibliotecas populares como Material UI e Chakra UI, nós não temos nenhum componente com estilos de cores, fontes, bordas, etc.
Todos os nossos componentes são **primitivas de layout** com suporte a diversas props como padding, margin, height, width, etc.

### Responsiveness 💡

Todas as propriedades dos componentes são **responsivas**, o que facilita a construção de interfaces que suportam multiplos dispositivos.
Através dos **breakpoints** definidos pela biblioteca, você pode mudar facilmente os aspectos de um componente em um determinado tamanho de tela ou dispositivo.

### Consistent design 🎨

Apesar de não ter componentes estilizados, nós prezamos pela consistência no design, principalmente quando se trata de espaçamentos, bordas e grids.

### Customizable ⚙️

Todas as propriedades e parâmetros utilizados pelo Ancestor são customizaveis: Breakpoints, Padding, Margin, Colunas do Grid, etc.

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
      size=[xxs(#12), md(#6)]
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

_ Exemplo de código do projeto [ReScript Conduit](https://github.com/rescriptbr/rescript-conduit/blob/master/src/pages/Signin/Signin.res)_
