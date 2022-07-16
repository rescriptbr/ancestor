---
title: <Hidden /> 
---

import CodeBlock from '@theme/CodeBlock'
import { Wrapper } from '../_helpers'
import { make as FirstHiddenExample } from './examples/FirstHiddenExample.bs'
import FirstHiddenExampleSource from '!!raw-loader!./examples/FirstHiddenExample.res'

`<Hidden />` is used to visually hide components.

## Example

<CodeBlock className='language-rescript'> {FirstHiddenExampleSource}</CodeBlock>

:::important
Resize your browser to see the responsive styles in action.
:::

<Wrapper>
  <FirstHiddenExample />
</Wrapper>

## Props
`<Hidden />` acceppts all props defined by the [system props](/docs/system-props).
Furthermore, it also accepts the following properties:

### `on`
- Type: `responsiveProp<bool>`
- Optional: True

:::important
 The `responsiveProp` is a customizable type defined in the Ancestor's setup.
 You can see the default breakpoints defined in the **[Ancestor's default setup](/docs/customization#default-breakpoints)** or define **[your own breakpoints](/docs/customization#custom-breakpoints)**.
:::
