module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily: 'Hack, Menlo, Monaco, monospace',

    // terminal cursor background color (hex)
    cursorColor: '',

    // color of the text
    foregroundColor: '',

    // terminal background color
    backgroundColor: '',

    // border color (window, tabs)
    borderColor: '',

    termCSS: '',
    css: '',

    // custom transparency value
    transparentBgAlpha: 0.7,

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    cursorShape: 'BLOCK',

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: {},
  },

  // a list of plugins to fetch and install from npm
  plugins: [
    'hyper-electron-highlighter',
    'hyperlinks',
    'hyperterm-blink',
    'hyperterm-subpixel-antialiased'
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [
  ]
};
