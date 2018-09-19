'use strict'

// will build an array of HSL values with the same hue and
// saturation values, and lightness values going from 10% -100%
// then we just reference the index in the array for our desired color.
let mono = Array(7).fill().map((x,i) => `hsl(221, 6%, ${10 + (i*15)}%)`)

const black = mono[0]
const white = mono[6]
const lightBlack = mono[2]

const red = '#ff5869'
const green = '#6af699'
const yellow = mono[4]
const blue = mono[5]
const magenta = mono[5]
const cyan = mono[4]

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

const backgroundColor = black
const foregroundColor = mono[3]
const selectionColor = 'hsla(221, 90%, 75%, 0.15)'
const tabText = mono[2]
const tabTextActive = white
const dividerBg = mono[1]
const cursorColor = green
const borderColor = mono[1]

module.exports = {
  config: {
    updateChannel: 'canary',
    shell: '/usr/local/bin/fish',
    fontSize: 15,
    lineHeight: 1.2,
    fontWeight: 'normal',
    fontWeightBold: 'normal',
    fontFamily: 'Fira Mono',
    cursorShape: 'UNDERLINE',
    selectionColor,
    foregroundColor,
    backgroundColor,
    borderColor,
    cursorColor,
    colors,
    css: `
      .tabs_title {
  			display: none !important;
  		}
      .tab_textInner {
        color: ${tabText};
        font-weight: 500;
      }
      .tab_tab.tab_active {
        background-color: ${backgroundColor};
      }
      .tab_tab.tab_active .tab_textInner {
        color: ${tabTextActive};
      }
      .splitpane_divider {
        background-color: ${dividerBg} !important;
      }
    `
  },
  plugins: [
    'hypercwd',
    // 'hyper-electron-highlighter',
    'hyper-hide-title',
  ],
  localPlugins: [],
}
