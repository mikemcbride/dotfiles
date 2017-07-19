'use strict'

module.exports = {
  config: {
    shell: '/bin/zsh',
    fontSize: 16,
    fontFamily: 'Hack, SF Mono',
    cursorShape: 'BLOCK',
    termCSS: `
      x-screen a {
        color: '#ff2e88';
      }
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
    'hypercwd',
    'hyper-hide-title',
    'hyperlinks',
    'hyper-font-smoothing',
  ],
  localPlugins: []
}
