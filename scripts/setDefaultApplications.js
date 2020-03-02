#!/usr/bin/env node

(async function setDefaultApps() {  
  const execa = require('execa')
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

  await Promise.all(promises)
  console.log('done')
})()