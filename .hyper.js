'use strict'

module.exports = {
  config: {
    shell: '/bin/zsh',
    fontSize: 14,
    fontFamily: 'Hack, SF Mono',
    cursorShape: 'BLOCK',
    termCSS: `
      x-screen a {
        color: '#ff2e88';
      }
    `,
    css: `
      .tab_text.tab_textActive {
        font-weight: 600;
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
  localPlugins: []
}
