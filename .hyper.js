'use strict'

// build config object
const config = {
  transparentBgAlpha: 0.6,
  fontSize: 14,
  cursorShape: 'BEAM'
}

// a list of plugins to fetch and install from npm
const plugins = [
  'hyper-electron-highlighter',
  'hyperlinks',
  'hypercwd',
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
