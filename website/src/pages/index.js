import React from 'react'
import clsx from 'clsx'
import Layout from '@theme/Layout'
import Link from '@docusaurus/Link'
import useDocusaurusContext from '@docusaurus/useDocusaurusContext'
import Home from './Home.bs'

export default function Index() {
  const { siteConfig } = useDocusaurusContext()

  return (
    <Layout
      title={siteConfig.title}
      description='Description will go into a meta tag in <head />'
    >
      <Home />
    </Layout>
  )
}
