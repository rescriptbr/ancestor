---
title: Base
---

import CodeBlock from '@theme/CodeBlock'
import { Wrapper, cleanUpCode } from '../helpers'
import { make as FirstBaseExample } from './examples/FirstBaseExample.bs'
import FirstBaseExampleSource from '!!raw-loader!./examples/FirstBaseExample.res'

A base component to built other components that accepts responsive props.

## Example

<CodeBlock className="language-reason"> {cleanUpCode(FirstBaseExampleSource)}</CodeBlock>

<Wrapper>
  <FirstBaseExample />
  </Wrapper>

## Props
Base component accepts all props defined by the [system props](/docs/system-props).
Furthermore, the component accepts the following properties:

### `tag`

Defines the tag that will be rendered

Default: `#div`
- Type: `responsiveProp<[`
  - `| #a`
  - `| #abbr`
  - `| #acronym`
  - `| #address`
  - `| #applet`
  - `| #area`
  - `| #article`
  - `| #aside`
  - `| #audio`
  - `| #b`
  - `| #base`
  - `| #basefont`
  - `| #bdo`
  - `| #big`
  - `| #blockquote`
  - `| #body`
  - `| #br`
  - `| #button`
  - `| #canvas`
  - `| #caption`
  - `| #center`
  - `| #cite`
  - `| #code`
  - `| #col`
  - `| #colgroup`
  - `| #datalist`
  - `| #dd`
  - `| #del`
  - `| #dfn`
  - `| #div`
  - `| #dl`
  - `| #dt`
  - `| #em`
  - `| #embed`
  - `| #fieldset`
  - `| #figcaption`
  - `| #figure`
  - `| #font`
  - `| #footer`
  - `| #form`
  - `| #frame`
  - `| #frameset`
  - `| #head`
  - `| #header`
  - `| #h1`
  - `| #h2`
  - `| #h3`
  - `| #h3`
  - `| #h4`
  - `| #h5`
  - `| #h6`
  - `| #hr`
  - `| #html`
  - `| #i`
  - `| #iframe`
  - `| #img`
  - `| #input`
  - `| #ins`
  - `| #kbd`
  - `| #label`
  - `| #legend`
  - `| #li`
  - `| #link`
  - `| #main`
  - `| #map`
  - `| #mark`
  - `| #meta`
  - `| #meter`
  - `| #nav`
  - `| #noscript`
  - `| #object`
  - `| #ol`
  - `| #optgroup`
  - `| #option`
  - `| #p`
  - `| #param`
  - `| #pre`
  - `| #progress`
  - `| #q`
  - `| #s`
  - `| #samp`
  - `| #script`
  - `| #section`
  - `| #select`
  - `| #small`
  - `| #source`
  - `| #span`
  - `| #strike`
  - `| #strong`
  - `| #style`
  - `| #sub`
  - `| #sup`
  - `| #table`
  - `| #tbody`
  - `| #td`
  - `| #textarea`
  - `| #tfoot`
  - `| #th`
  - `| #thead`
  - `| #time`
  - `| #title`
  - `| #tr`
  - `| #u`
  - `| #ul`
  - `| #var`
  - `| #video`
  - `| #wbr`

  `]>`


