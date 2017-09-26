'use strict'

const black = '#181818'
const white = '#f8f8f8'
const red = '#ff5869'
const green = '#50e3c2'
const cyan = green
const yellow = '#b8b8b8'
const blue = '#989898'
const magenta = '#b8b8b8'
const lightWhite = '#b8b8b8'
const lightBlack = '#585858'

const colors = {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
  lightBlack,
  lightRed: red,
  lightGreen: green,
  lightYellow: yellow,
  lightBlue: blue,
  lightMagenta: magenta,
  lightCyan: cyan,
  lightWhite
}

const cursorColor = 'rgb(248,29,229)'
const borderColor = '#383838'

const tabText = '#999' 
const tabTextActive = white
const dividerBg = 'rgba(255,255,255,.2)'
const linkColor = '#4ff2f8'

module.exports = {
  config: {
    updateChannel: 'canary',
    shell: '/bin/zsh',
    foregroundColor: white,
    backgroundColor: black,
    borderColor,
    cursorColor,
    colors,
    fontSize: 15,
    fontFamily: 'Operator Mono, Hack, SF Mono',
    cursorShape: 'BLOCK',
    termCSS: `
      .terminal-cursor {
        mix-blend-mode: difference;
      }
      .xterm-rows a {
        color: ${linkColor};
      }
      
      .terminal span.unicode-node { vertical-align: text-bottom; }
    `,
    css: `
      .tab_text.tab_textActive {
        font-weight: 500;
      }
      .tab_textInner {
        color: ${tabText};
      }
      .tab_tab.tab_active .tab_textInner {
        color: ${tabTextActive};
      }
      .splitpane_divider {
        background-color: ${dividerBg} !important;
      }
    `,
    hyperlinks: {
      defaultBrowser: true
    }
  },
  plugins: [
    'hypercwd',
    'hyper-hide-title',
    'hyperlinks',
    'hyper-font-smoothing',
  ],
  localPlugins: [],
}
