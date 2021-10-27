#!/usr/bin/env node
import fs from 'node:fs/promises'
import os from 'node:os'
import path from 'node:path'
const configs = [
    {
        appName: 'vimrc',
        configFile: path.join(os.homedir(), 'src/dotvim/vimrc'),
        darkTheme: 'let mikecolor="dark"',
        lightTheme: 'let mikecolor="light"'
    },
    {
        appName: 'VS Code',
        configFile: path.join(os.homedir(), 'Library/Application\ Support/Code/User/settings.json'),
        darkTheme: `"workbench.colorTheme": "Electron Highlighter"`,
        lightTheme: `"workbench.colorTheme": "Early Riser"`
    },
    {
        appName: 'Hyper',
        configFile: path.join(os.homedir(), 'src/dotfiles/.hyper.js'),
        darkTheme: 'hyper-electron-highlighter',
        lightTheme: 'hyper-early-riser'
    }
]

await Promise.allSettled(configs.map(config => parseFileAndSetTheme(config)))

async function parseFileAndSetTheme(opts) {
    const fileContents = await fs.readFile(opts.configFile, 'utf-8')
    const isDark = fileContents.includes(opts.darkTheme)
    const isLight = fileContents.includes(opts.lightTheme)
    let newTheme = process.argv[2] || isDark ? 'light' : 'dark'
    if (newTheme === 'light' && !isLight) {
        const updated = fileContents.replace(opts.darkTheme, opts.lightTheme)
        await fs.writeFile(opts.configFile, updated).catch(err => { console.error(err) })
        console.log(`Updated ${opts.appName}`)
    } else if (newTheme === 'dark' && !isDark) {
        const updated = fileContents.replace(opts.lightTheme, opts.darkTheme)
        await fs.writeFile(opts.configFile, updated).catch(err => { console.error(err) })
        console.log(`Updated ${opts.appName}`)
    } else {
        console.log(`${opts.appName} is already using ${desiredTheme} theme`)
    }
}
