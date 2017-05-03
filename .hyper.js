'use strict'

module.exports = {
  config: {
    shell: '/bin/zsh',
    fontSize: 14,
    fontFamily: 'SF Mono',
    cursorShape: 'BLOCK',
    cursorColor: 'rgb(113, 177, 254)',
    termCSS: `
      x-screen a {
        color: #4ff2f8;
      }
    `,
    hyperlinks: {
      defaultBrowser: true
    }
  },
  plugins: [
    'hyper-electron-highlighter',
    'hypercwd',
    'hyperlinks',
    'hyper-font-smoothing',
  ],
  localPlugins: []
}
