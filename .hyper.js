'use strict'

const black = '#212836'
const white = '#97a7c8'
const red = '#e76572'
const green = '#6af699'
const yellow = '#fffa9e'
const blue = '#71b1fe'
const magenta = '#d59df6'
const cyan = '#4ff2f8'
const lightBlack = '#506686'

// some color overrides. see http://bit.ly/29k1iU2 for
// the full list
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
  lightWhite: white
}

const backgroundColor = 'rgba(33,40,54,.8)'
const foregroundColor = white 
const cursorColor = '#528bff'
const borderColor = '#4d596b'
const fontSize = 14
const fontFamily = 'Hack, Menlo, Monaco, monospace'
const padding = '12px 14px'
const cursorShape = 'BEAM'

const tabBgDark = 'rgba(0,0,0,.2)'
const tabText = 'rgb(153,163,184)'
const tabTextActive = '#d5d9e2'
const dividerBg = borderColor

const termCSS = `
  .cursor-node {
    mix-blend-mode: difference;
  }
`
const css = `
  .tabs_list {
    margin-left: 0;
  }
  .tab_tab.tab_first {
    padding-left: 82px;
  }
  .tab_textInner {
    color: ${tabText};
  }
  .tab_tab:not(.tab_active) {
    background-color: ${tabBgDark};
  }
  .tab_tab.tab_active .tab_textInner {
    color: ${tabTextActive};
  }
  .tab_tab.tab_active {
    font-weight: 600;
  }
  .tab_firstActive {
    border-left-width: 0px;
  }
  .tabs_borderShim {
    border-width: 0 !important;
  }
  .splitpane_divider {
    background-color: ${dividerBg};
  }
`

// build config object
const config = {
  fontSize,
  fontFamily,
  cursorColor,
  foregroundColor,
  backgroundColor,
  borderColor,
  termCSS,
  css,
  padding,
  cursorShape,
  colors
}

// a list of plugins to fetch and install from npm
const plugins = [
  'hyperlinks',
  'hypertitle',
  'hypercwd',
  'hyperterm-subpixel-antialiased',
  'hyperterm-lastpass'
]

// in development, you can create a directory under
// `~/.hyper_plugins/local/` and include it here
// to load it and avoid it being `npm install`ed
const localPlugins = []

// onWindow allows us to set vibrancy
const onWindow = browserWindow => browserWindow.setVibrancy('dark')


// export all the stuff we care about
module.exports = {
  config,
  plugins,
  localPlugins,
  onWindow
}
