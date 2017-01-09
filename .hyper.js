// build config object
const config = {
  fontSize: 14
}

// a list of plugins to fetch and install from npm
const plugins = [
  'hyper-website-theme',
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
