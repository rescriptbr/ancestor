module Hooks = {
  type siteConfig = {title: string}

  type docusaurusContext = {siteConfig: siteConfig}

  @module("@docusaurus/useDocusaurusContext")
  external useDocusaurusContext: unit => docusaurusContext = "default"
}
