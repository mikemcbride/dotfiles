'use strict'

module.exports = {
  config: {
    updateChannel: 'canary',
    shell: '/bin/zsh',
    fontSize: 14,
    fontFamily: 'Fira Code, Fira Mono, Operator Mono, Hack, SF Mono',
    cursorShape: 'BLOCK',
    css: `
      body {
        -webkit-backface-visibility: unset;
        backface-visibility: unset;
      }
      .hyper_main {
        border-width: 2px !important;
        border-color: #4ff2f8 !important;
      }
      .header_header {
        top: 2px;
        left: 2px;
        right: 2px;
      }
    `,
    hyperlinks: {
      defaultBrowser: true
    }
  },
  plugins: [
    'hypercwd',
    // 'hyper-mono-christmas',
    'hyper-electron-highlighter',
    'hyper-hide-title',
    'hyperlinks',
    'hyper-font-smoothing',
  ],
  localPlugins: [],
}
