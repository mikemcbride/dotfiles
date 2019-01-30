'use strict'

module.exports = {
  config: {
    shell: '/usr/local/bin/fish',
    updateChannel: 'canary',
    fontSize: 15,
    lineHeight: 1.2,
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    fontFamily: 'Fira Mono',
    cursorShape: 'UNDERLINE',
    cursorColor: '#34febb'
  },
  plugins: [
    'hypercwd',
    // 'hyper-snazzy',
    'hyper-electron-highlighter',
    'hyper-hide-title'
  ]
}
