#!/usr/bin/env node

const fs = require('fs')
const { promisify } = require('util')
const readFile = promisify(fs.readFile)
const writeFile = promisify(fs.writeFile)

const hyperConfigFile = '/Users/mcbridem/src/dotfiles/.hyper.js'
const vsCodeConfigFile = '/Users/mcbridem/Library/Application\ Support/Code/User/settings.json'

readFile(hyperConfigFile, 'utf8').then(res => {
    let isDark = res.includes('hyper-electron-highlighter')
    let themeNames = []
    let cursorColors = []
    if (isDark) {
        // make it light
        themeNames = ['hyper-electron-highlighter', 'hyper-early-riser']
        cursorColors = ['cursorColor', '// cursorColor']
    } else {
        themeNames = ['hyper-early-riser', 'hyper-electron-highlighter']
        cursorColors = ['// cursorColor', 'cursorColor']
    }

    newFile = res.replace(themeNames[0], themeNames[1])
    newFile = newFile.replace(cursorColors[0], cursorColors[1])

    writeFile(hyperConfigFile, newFile).then(() => {
        console.log('Updated hyper config')
    }).catch(err => {
        console.error(err)
    })
}).catch(err => {
    console.error(err)
})

readFile(vsCodeConfigFile, 'utf8').then(res => {
    const lightTheme = `"workbench.colorTheme": "Early Riser"`
    const darkTheme = `"workbench.colorTheme": "Electron Highlighter"`
    let newFile = ''
    if (res.includes(darkTheme)) {
        newFile = res.replace(darkTheme, lightTheme)
    } else {
        newFile = res.replace(lightTheme, darkTheme)
    }
    writeFile(vsCodeConfigFile, newFile).then(() => {
        console.log('Updated VS Code settings')
    }).catch(err => {
        console.error(err)
    })
}).catch(err => {
    console.error(err)
})
