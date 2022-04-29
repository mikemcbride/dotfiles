'use strict'

module.exports = {
    config: {
        updateChannel: 'canary',
        preserveCWD: true,
        shell: '/opt/homebrew/bin/fish',
        scrollback: 10000,
        fontSize: 16,
        lineHeight: 1.5,
        fontWeight: 'normal',
        fontWeightBold: 'normal',
        fontFamily: 'MonoLisa Nerd Font',
        cursorShape: 'BLOCK',
        selectionColor: 'rgba(33, 40, 54, .5)'
    },
    plugins: [],
    localPlugins: [
        // 'hyper-gruvbox'
        'hyper-everforest'
    ]
}
