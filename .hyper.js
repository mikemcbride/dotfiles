'use strict'

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
    cursorColor: '#34febb',
    css: `
      body {
        -webkit-backface-visibility: unset;
        backface-visibility: unset;
      }
      .tab_tab.tab_active:after {
        content: '';
        pointer-events: none;
        z-index: 2;
        position: absolute;
        top: -1px;
        left: 0;
        bottom: 0;
        width: 2px;
        background-color: #568af2;
      }
    `
  },
  plugins: [
    'hypercwd',
    'hyper-electron-highlighter',
    'hyper-hide-title',
  ],
  localPlugins: [],
}
