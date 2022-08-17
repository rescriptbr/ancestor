---
title: useResponsiveValue(...)
---

import CodeBlock from '@theme/CodeBlock'
import { Wrapper } from '../_helpers'
import ResponsiveValueExampleSource from '!!raw-loader!./ResponsiveValueExample.res'
import { make as ResponsiveValueExample } from './ResponsiveValueExample.bs'

`useResponsiveValue(...)` is a custom hook that returns the value for the current breakpoint. You provide an array of responsive values
and it returns the value for the current breakpoint.

<CodeBlock className='language-rescript'> {ResponsiveValueExampleSource}</CodeBlock>

:::important
Resize your browser to see the responsive values in action.
:::

<Wrapper> <ResponsiveValueExample /> </Wrapper>

## API
The hook has the following type signature
```rescript
let useResponsiveValue:(
 'value,
  ResponsiveValueHook.Styles.responsiveProp<'value>,
) => 'value
```
