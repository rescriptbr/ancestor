type siteConfig = {title: string}

type docusaurusContext = {siteConfig: siteConfig}

@module("@docusaurus/useDocusaurusContext")
external useDocusaurusContext: unit => docusaurusContext = "default"

module Layout = {
  @react.component @module("@theme/Layout")
  external make: (~title: string, ~description: string, ~children: React.element) => React.element =
    "default"
}
