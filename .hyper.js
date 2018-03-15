'use strict'

module.exports = {
  config: {
    updateChannel: 'canary',
    shell: '/bin/zsh',
    fontSize: 14,
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    fontFamily: 'Fira Mono, Operator Mono, Hack, SF Mono',
    cursorShape: 'BLOCK',
    css: `
      body {
        -webkit-backface-visibility: unset;
        backface-visibility: unset;
      }
    `,
    hyperlinks: {
      defaultBrowser: true
    }
  },
  plugins: [
    'hypercwd',
    'hyper-electron-highlighter',
    'hyper-hide-title',
    'hyperlinks',
  ],
  localPlugins: [],
}
