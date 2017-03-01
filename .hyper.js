'use strict'

module.exports = {
  config: {
    fontSize: 14,
    fontFamily: 'Hack',
    cursorShape: 'BLOCK'
  },
  plugins: [
    'hyper-electron-highlighter',
    'hypercwd',
    'hyperlinks'
  ],
  localPlugins: [],
  hyperlinks: {
    clickAction: 'ignore',
    defaultBrowser: true
  }
}
