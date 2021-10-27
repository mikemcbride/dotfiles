#!/usr/bin/env node

// I'm intentionally leaving this one as commonJS because it's only got one dependency,
// which hasn't yet been updated to ESM.
const execa = require('execa');

(async () => {
    const appId = 'com.microsoft.VSCode'
    const extensions = [
        'js',
        'jsx',
        'vue',
        'md',
        'json',
        'css',
        'sass',
        'scss',
        'less',
        'svelte',
        'd',
        'fish',
        'txt',
        'xml',
        'sh',
        'styl',
        'markdown',
    ]
    const promises = extensions.map(ext => {
        return execa('duti', ['-s', appId, ext, 'all'])
    })

    await Promise.allSettled(promises)
    console.log('done')
})();
