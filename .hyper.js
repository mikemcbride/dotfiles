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
      .tab_tab.tab_active::after {
        content: '';
        position: absolute;
        top: -1px;
        right: 0;
        left: 0;
        height: 2px;
        background-color: #528bff;
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
