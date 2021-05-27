#!/usr/bin/env node

const fs = require('fs')
const os = require('os')
const path = require('path')
const util = require('util')

const homedir = os.homedir()
const readFile = util.promisify(fs.readFile)
const writeFile = util.promisify(fs.writeFile)

const hyperConfigFile = path.join(homedir, 'src/dotfiles/.hyper.js')
const vsCodeConfigFile = path.join(homedir, 'Library/Application\ Support/Code/User/settings.json')
const vimrc = path.join(homedir, 'src/dotvim/vimrc')

let desiredTheme = process.argv[2]

readFile(hyperConfigFile, 'utf8').then(res => {
    let isDark = res.includes('hyper-electron-highlighter')
    let isLight = res.includes('hyper-early-riser')
    let didChange = false
    let newTheme = desiredTheme
    if (!newTheme) {
        newTheme = isDark ? 'light' : 'dark'
    }
    let themeNames = []
    let cursorColors = []
    if (newTheme === 'light' && !isLight) {
        didChange = true
        // make it light
        themeNames = ['hyper-electron-highlighter', 'hyper-early-riser']
        cursorColors = ['cursorColor', '// cursorColor']
    } else if (newTheme === 'dark' && !isDark) {
        didChange = true
        themeNames = ['hyper-early-riser', 'hyper-electron-highlighter']
        cursorColors = ['// cursorColor', 'cursorColor']
    }
    if (didChange) {
        newFile = res.replace(themeNames[0], themeNames[1])
        newFile = newFile.replace(cursorColors[0], cursorColors[1])

        writeFile(hyperConfigFile, newFile).then(() => {
            console.log('Updated hyper config')
        }).catch(err => {
            console.error(err)
        })
    } else {
        console.log(`Hyper is already using ${desiredTheme} theme`)
    }
}).catch(err => {
    console.error(err)
})

readFile(vsCodeConfigFile, 'utf8').then(res => {
    let newTheme = desiredTheme
    const lightTheme = `"workbench.colorTheme": "Early Riser"`
    const darkTheme = `"workbench.colorTheme": "Electron Highlighter"`
    const isDark = res.includes(darkTheme)
    const isLight = res.includes(lightTheme)
    let didChange = false
    let newFile = ''

    if (!newTheme) {
        newTheme = isDark ? 'light' : 'dark'
    }

    if (newTheme === 'light' && !isLight) {
        didChange = true
        newFile = res.replace(darkTheme, lightTheme)
    } else if (newTheme === 'dark' && !isDark) {
        didChange = true
        newFile = res.replace(lightTheme, darkTheme)
    }
    if (didChange) {
        writeFile(vsCodeConfigFile, newFile).then(() => {
            console.log('Updated VS Code settings')
        }).catch(err => {
            console.error(err)
        })
    } else {
        console.log(`VS Code is already using ${desiredTheme} theme`)
    }
}).catch(err => {
    console.error(err)
})

readFile(vimrc, 'utf8').then(res => {
    let newTheme = desiredTheme
    const darkTheme = 'let mikecolor="dark"'
    const lightTheme = 'let mikecolor="light"'
    let isDark = res.includes(darkTheme)
    let isLight = res.includes(lightTheme)
    let didChange = false
    if (!newTheme) {
        newTheme = isDark ? 'light' : 'dark'
    }
    if (newTheme === 'light' && !isLight) {
        didChange = true
        newFile = res.replace(darkTheme, lightTheme)
    } else if (newTheme === 'dark' && !isDark) {
        didChange = true
        newFile = res.replace(lightTheme, darkTheme)
    }
    if (didChange) {
        writeFile(vimrc, newFile).then(() => {
            console.log('Updated vimrc')
        }).catch(err => {
            console.error(err)
        })
    } else {
        console.log(`vimrc is already using ${desiredTheme} theme`)
    }
}).catch(err => {
    console.error(err)
})
