'use strict'

module.exports = {
  config: {
    shell: '/bin/zsh',
    fontSize: 16,
    fontFamily: 'Operator Mono, SF Mono',
    cursorShape: 'BLOCK',
    termCSS: `
      x-screen a {
        color: '#ff2e88';
      }
      
      x-row span.unicode-node { vertical-align: text-bottom; }
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
    'hyper-electron-highlighter',
    // 'hyper-website-theme',
    'hypercwd',
    'hyper-hide-title',
    'hyperlinks',
    'hyper-font-smoothing',
  ],
  localPlugins: [],
  updateChannel: 'canary'
}
