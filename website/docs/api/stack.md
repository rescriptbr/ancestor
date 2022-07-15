---
title: <Stack /> 
---

import CodeBlock from '@theme/CodeBlock'
import { Wrapper } from '../_helpers'
import { make as FirstStackExample } from './examples/FirstStackExample.bs'
import { make as SecondStackExample } from './examples/SecondStackExample.bs'
import FirstStackExampleSource from '!!raw-loader!./examples/FirstStackExample.res'
import SecondStackExampleSource from '!!raw-loader!./examples/SecondStackExample.res'

`<Stack />` is a component used to group elements together.


## Example

<CodeBlock className='language-rescript'> {FirstStackExampleSource}</CodeBlock>

:::important
Resize your browser to see the responsive styles in action.
:::

<Wrapper>
  <FirstStackExample />
</Wrapper>

## Using dividers

<CodeBlock className='language-rescript'> {SecondStackExampleSource}</CodeBlock>

<Wrapper>
  <SecondStackExample />
</Wrapper>



## Props
`<Stack />` accepts all props defined by the system props. Furthermore, it also accepts the following properties:

### `spacing`
- Type: `responsiveProp<Config.spacing>`
- Optional: True

### `direction`
- Type: `responsiveProp<[ #vertical | #horizontal ]>`
- Optional: True

### `divider`
- Type: `React.element`
- Optional: True


:::important
 The `responsiveProp` is a customizable type defined in the Ancestor's setup.
 You can see the default breakpoints defined in the **[Ancestor's default setup](/docs/customization#default-breakpoints)** or define **[your own breakpoints](/docs/customization#custom-breakpoints)**.
:::
