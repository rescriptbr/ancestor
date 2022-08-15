module.exports = {
  docs: [
    'intro',
    'getting-started',
    'customization/customization',
    {
      type: `category`,
      label: `API Reference`,
      collapsed: false,
      items: [
        'system-props',
        'api/base',
        'api/box',
        'api/grid',
        'api/hidden',
        'api/stack',
      ],
    },
  ],
}
