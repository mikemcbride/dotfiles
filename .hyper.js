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
        font-weight: 500;
      }
    `,
    hyperlinks: {
      defaultBrowser: true
    },
    paneNavigation: {
      hotkeys: {
        navigation: {
          up: 'alt+shift+up',
          down: 'alt+shift+down',
          left: 'alt+shift+left',
          right: 'alt+shift+right'
        },
        jump_prefix: 'alt+shift',
        permutation_modifier: 'ctrl',
        maximize: 'meta+enter'
      },
      showIndicators: false
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
  localPlugins: []
}
