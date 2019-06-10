'use strict'

module.exports = {
  config: {
    shell: '/usr/local/bin/fish',
    fontSize: 15,
    lineHeight: 1.2,
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    fontFamily: 'Fira Mono',
    cursorShape: 'UNDERLINE',
    cursorColor: '#34febb',
  },
  plugins: [
    'hypercwd',
    'hyper-hide-title',
    // 'hyper-early-riser'
    'hyper-electron-highlighter'
  ],
  localPlugins: [
    // 'hyper-early-riser'
    // 'hyper-electron-highlighter'
  ]
}
