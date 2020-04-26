'use strict'

module.exports = {
  config: {
    webGLRenderer: false,
    shell: '/usr/local/bin/fish',
    scrollback: 10000,
    fontSize: 16,
    lineHeight: 1.2,
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    fontFamily: 'Operator Mono',
    cursorShape: 'BLOCK',
    cursorColor: '#34febb',
    selectionColor: 'rgba(33, 40, 54, .5)'
  },
  hypercwd: {
    initialWorkingDirectory: '~'
  },
  plugins: [
    'hypercwd',
    'hyper-hide-title',
    'hyper-electron-highlighter'
    // 'hyper-early-riser'
  ],
  localPlugins: [
    // 'hyper-tailwind-dark'
    // 'hyper-geist'
  ]
}
