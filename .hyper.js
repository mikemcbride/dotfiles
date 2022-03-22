'use strict'

module.exports = {
  config: {
    preserveCWD: true,
    shell: '/opt/homebrew/bin/fish',
    scrollback: 10000,
    fontSize: 14,
    lineHeight: 1.3,
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    fontFamily: 'MonoLisa',
    cursorShape: 'BLOCK',
    selectionColor: 'rgba(33, 40, 54, .5)'
  },
  plugins: [
    'hyper-electron-highlighter'
  ],
  localPlugins: []
}
