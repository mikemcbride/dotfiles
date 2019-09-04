'use strict'

module.exports = {
  config: {
    shell: '/usr/local/bin/fish',
    fontSize: 15,
    lineHeight: 1.2,
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    fontFamily: 'Fira Mono',
    cursorShape: 'BLOCK',
    cursorColor: '#34febb',
  },
  plugins: [
    'hypercwd',
    'hyper-hide-title',
    'hyper-electron-highlighter'
  ],
  localPlugins: [
    // 'hyper-tailwind-dark'
    // 'hyper-geist'
  ]
}
