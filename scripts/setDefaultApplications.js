#!/usr/bin/env node

// I'm intentionally leaving this one as commonJS because it's only got one dependency,
// which hasn't yet been updated to ESM.
const execa = require('execa');

(async () => {
    const appId = 'dev.zed.Zed'
    const extensions = [
        'js',
        'mjs',
        'cjs',
        'jsx',
        'ts',
        'tsx',
        'vue',
        'md',
        'markdown',
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
        'py',
        'rs',
        'go',
        'toml',
        'yml',
        'yaml',
        'tf',
    ]
    const promises = extensions.map(ext => {
        return execa('duti', ['-s', appId, ext, 'all'])
    })

    await Promise.allSettled(promises)
    console.log('done')
})();
