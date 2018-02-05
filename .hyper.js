'use strict'

module.exports = {
  config: {
    updateChannel: 'canary',
    shell: '/bin/zsh',
    fontSize: 14,
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
    // 'hyper-mono-christmas',
    // 'hyper-electron-highlighter',
    'hyper-firefox-devtools',
    'hyper-hide-title',
    'hyperlinks',
    'hyper-font-smoothing',
  ],
  localPlugins: [],
}
