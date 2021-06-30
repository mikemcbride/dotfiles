#!/usr/bin/env node

// invoke prune.sh in recursive directories.
// if an argument x is passed as a second parameter,
// it will traverse the directories x levels starting at cwd.
// otherwise, runs prune.sh in the current directory.
const path = require('path')
const fsPromises = require('fs/promises')

const execa = require('execa')
const chalk = require('chalk')
const Timer = require('nodejs-process-timer')
const prettyBytes = require('pretty-bytes')

const levels = parseInt(process.argv[2], 10) || 0

let totalSize = 0

const byteConversion = {
    B: 1,
    KB: 1000,
    MB: 1000*1000,
    GB: 1000*1000*1000
}

// run it!
pruneFiles()

async function pruneFiles() {
    // figure out which directories we're pruning.
    // calculate total filesize beforehand, then again after removing the files
    console.log(chalk.green(`Pruning files ${levels} levels deep starting in ${process.cwd()}`))
    const t = new Timer()
    t.start()
    let dirsToPrune = await getRecursiveDirectories(process.cwd(), levels)
    await Promise.allSettled(dirsToPrune.map(dir => execute(dir)))
    logTotalSizeRemoved()
}

async function getRecursiveDirectories(srcpath, levels) {
    let dirs = [srcpath]

    // while levels is not zero, recursively get directories for each dir and decrement levels
    while (levels > 0) {
        let newDirs = await Promise.allSettled(dirs.map(dir => getDirectories(dir)))
        dirs = newDirs.filter(dir => dir.status === 'fulfilled').map(dir => dir.value).flat()
        levels--
    }

    return dirs
}

async function getDirectories(srcpath) {
    let files = await fsPromises.readdir(srcpath)
    let fileStats = await Promise.allSettled(files.map(file => fsPromises.lstat(path.join(srcpath, file))))
    let directories = []
    for (let i in fileStats) {
        // files and corresponding stats will have the same index since we're using .map
        const stat = fileStats[i]
        const dir = files[i]
        if (stat.status === 'fulfilled' && stat.value.isDirectory()) {
            directories.push(path.join(srcpath, dir, 'node_modules'))
        }
    }
    let pExists = await Promise.allSettled(directories.map(d => fsPromises.access(d)))
    let exist = []
    for (let i in pExists) {
        // same index trick here to relate promise response to corresponding directory
        const response = pExists[i]
        const dir = directories[i]
        if (response.status === 'fulfilled' && response.value === undefined) {
            exist.push(dir)
        }
    }
    return exist
}

async function execute(dir) {
    const r = await execa('node-prune', [dir])
    console.log(`pruning files in ${dir}`)
    console.log(r.stdout)
    console.log('-------------------------\n')
    parseTotalSizeRemoved(r.stdout)
}

function parseTotalSizeRemoved(input) {
    const re = /size removed.*\s(\d*)\s(B|KB|MB|GB)/gmi
    const match = re.exec(input)
    const size = parseInt(match[1], 10)
    const b = match[2]
    const sizeInBytes = convertToBytes(size, b)
    totalSize += sizeInBytes
}

function logTotalSizeRemoved() {
    console.log(chalk.green(`Total file size removed: ${prettyBytes(totalSize)}`))
}

function convertToBytes(size, type) {
    if (byteConversion[type]) {
        return size * byteConversion[type]
    } else {
        return 0
    }
}
