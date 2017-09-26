'use strict'

module.exports = {
  config: {
    updateChannel: 'canary',
    shell: '/bin/zsh',
    fontSize: 15,
    fontFamily: 'Operator Mono, Hack, SF Mono',
    cursorShape: 'BLOCK',
    cursorColor: '#528bff',
    termCSS: `
      .xterm-rows a {
        color: #ff2e88;
      }
      
      .terminal span.unicode-node { vertical-align: text-bottom; }
    `,
    css: `
      .tab_text.tab_textActive {
        font-weight: 500;
      }
    `,
    hyperlinks: {
      defaultBrowser: true
    }
  },
  plugins: [
    // 'hyper-electron-highlighter',
    'hyper-website-theme',
    'hypercwd',
    'hyper-hide-title',
    'hyperlinks',
    'hyper-font-smoothing',
  ],
  localPlugins: [],
}
