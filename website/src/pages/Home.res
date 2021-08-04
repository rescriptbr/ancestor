module Layout = {
  @react.component @module("@theme/Layout")
  external make: (~title: string, ~description: string, ~children: React.element) => React.element =
    "default"
}

@react.component
let make = () => {
  let {siteConfig} = Docusaurus.Hooks.useDocusaurusContext()

  <Layout title={siteConfig.title} description="Description will go into a meta tag in <head />">
    {React.string("Hello from Docs")}
  </Layout>
}

let default = make
