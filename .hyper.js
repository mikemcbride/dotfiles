'use strict'

module.exports = {
  config: {
    shell: '/bin/zsh',
    fontSize: 14,
    fontFamily: 'Hack',
    cursorShape: 'BLOCK',
    cursorColor: 'rgb(113, 177, 254)'
  },
  plugins: [
    'hyper-electron-highlighter',
    'hypercwd',
    'hyperlinks',
    'hyper-font-smoothing'
  ],
  localPlugins: [],
  hyperlinks: {
    clickAction: 'ignore',
    defaultBrowser: true
  }
}
