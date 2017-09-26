'use strict'

// color definitions
const mono1 = '#181818'
const mono2 = '#383838'
const mono3 = '#686868'
const mono4 = '#989898'
const mono5 = '#b8b8b8'
const mono6 = '#d8d8d8'
const mono7 = '#f8f8f8'

// only red and green are not mono-chrome
// this is helpful for many testing, linting, etc. things that are printed to the console.
const red = '#ff5869'
const green = '#6af699'

// config settings
const cursorColor = green
const borderColor = mono2
const tabText = mono4
const tabTextActive = mono7
const dividerBg = 'rgba(255,255,255,.2)'

const colors = {
  black: mono1,
  red,
  green,
  yellow: mono5,
  blue: mono4,
  magenta: mono5,
  cyan: mono5,
  white: mono7,
  lightBlack: mono3,
  lightRed: red,
  lightGreen: green,
  lightYellow: mono5,
  lightBlue: mono4,
  lightMagenta: mono5,
  lightCyan: mono5,
  lightWhite: mono6
}

module.exports = {
  config: {
    updateChannel: 'canary',
    shell: '/bin/zsh',
    foregroundColor: mono7,
    backgroundColor: mono1,
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
        color: ${green};
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
