'use strict'

const black = '#000'
const white = '#bbb'
const red = '#ff2e88'
const green = '#50e3c2'
const cyan = green
const yellow = '#fff'
const blue = '#fff'
const magenta = '#fff'
const lightWhite = '#fff'
const lightBlack = '#6c6c6c'

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
const borderColor = '#444'

const tabText = white
const tabTextActive = '#fff'
const dividerBg = 'rgba(255,255,255,.1)'

// build config object
const config = {
  fontSize: 14,
  cursorShape: 'UNDERLINE',
  foregroundColor: white,
  backgroundColor: black,
  borderColor,
  cursorColor,
  colors,
  termCSS: `
    .cursor-node {
      mix-blend-mode: difference;
    }
  `,
  css: `
    .tabs_list {
      margin-left: 0;
    }
    .tab_tab.tab_first {
      padding-left: 82px;
    }
    .tab_textInner {
      color: ${tabText};
    }
    .tab_tab.tab_active .tab_textInner {
      color: ${tabTextActive};
    }
    .tab_firstActive {
      border-left-width: 0px;
    }
    .tabs_borderShim {
      border-width: 0 !important;
    }
    .splitpane_divider {
      background-color: ${dividerBg} !important;
    }
  `
}

// a list of plugins to fetch and install from npm
const plugins = [
  // 'hyper-website-theme',
  // 'hyper-electron-highlighter',
  'hyperlinks',
  'hyper-font-smoothing',
  'hyperterm-lastpass'
]

// in development, you can create a directory under
// `~/.hyper_plugins/local/` and include it here
// to load it and avoid it being `npm install`ed
const localPlugins = []

// export all the stuff we care about
module.exports = {
  config,
  plugins,
  localPlugins
}
