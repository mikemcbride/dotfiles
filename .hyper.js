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
      .tab_tab.tab_active:after {
        content: '';
        pointer-events: none;
        z-index: 2;
        position: absolute;
        top: -1px;
        left: 0;
        right: 0;
        height: 2px;
        background-color: #568af2;
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
