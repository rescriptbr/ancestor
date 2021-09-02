const lightCodeTheme = require('prism-react-renderer/themes/github')
const darkCodeTheme = require('prism-react-renderer/themes/dracula')

/** @type {import('@docusaurus/types').DocusaurusConfig} */
module.exports = {
  title: 'Ancestor — UI primitives for ReScript and React',
  tagline: '',
  url: 'https://ancestor.netlify.app',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'rescriptbr',
  projectName: 'ancestor',
  themeConfig: {
    colorMode: {
      defaultMode: 'light',
      disableSwitch: true,
    },
    navbar: {
      logo: {
        alt: 'Ancestor Logo',
        src: 'img/logo-black.svg',
      },
      items: [
        {
          type: 'doc',
          docId: 'intro',
          position: 'left',
          label: 'Documentation',
        },
        {
          href: 'https://github.com/rescriptbr/ancestor',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'ReScript Brazil',
          items: [
            {
              label: 'Discord',
              href: 'https://discord.gg/wj7Ak9JJtZ',
            },
            {
              label: 'Twitter',
              href: 'https://twitter.com/rescriptbr',
            },
            {
              label: 'GitHub',
              href: 'https://github.com/rescriptbr',
            },
          ],
        },
        {
          title: 'About',
          items: [
            {
              label: 'Getting Started',
              to: '/docs/intro',
            },
            {
              label: 'Docs',
              to: '/docs/intro',
            },
            {
              label: 'GitHub',
              href: 'https://github.com/rescriptbr/ancestor',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} ReScript Brazil Community, Built with Docusaurus and ReScript.`,
    },
    prism: {
      theme: lightCodeTheme,
      darkTheme: darkCodeTheme,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl:
            'https://github.com/facebook/docusaurus/edit/master/website/',
        },
        theme: {
          customCss: require.resolve('./src/css/app.css'),
        },
      },
    ],
  ],
}
