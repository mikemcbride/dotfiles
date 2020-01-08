#!/usr/bin/env node

// invoke prune.sh in recursive directories.
// if an argument x is passed as a second parameter,
// it will traverse the directories x levels starting at cwd.
// otherwise, runs prune.sh in the current directory.
const fs = require('fs')
const path = require('path')
const execa = require('execa')

const levels = parseInt(process.argv[2], 10) || 0

if (levels > 0) {
  pruneFiles()
} else {
  // run it in the current directory
  const currentDir = process.cwd()
  if (currentDir.endsWith('/node_modules')) {
    execute(currentDir)
  } else {
    const nmDir = path.join(currentDir, 'node_modules')
    if (fs.existsSync(nmDir)) {
      execute(nmDir)
    } else {
      console.log('this command must be run in a directory that contains node_modules')
    }
  }
}

function getRecursiveDirectories(srcpath, levels) {  
  let dirs = [srcpath]
  
  // while levels is not zero, recursively get directories for each dir and decrement levels
  while (levels > 0) {
    dirs = dirs.reduce((acc, dir) => {
      return [...acc, ...getDirectories(dir)]
    }, [])
    
    levels--
  }
  
  return dirs
}

function getDirectories(srcpath) {
  return fs.readdirSync(srcpath)
    .filter(file => fs.lstatSync(path.join(srcpath, file)).isDirectory())
    .reduce((acc, it) => {
      const dirPath = path.join(srcpath, it)
      const nodeModulesPath = path.join(dirPath, 'node_modules')
      if (fs.existsSync(nodeModulesPath)) {
        acc.push(nodeModulesPath)
      }
      return acc
    }, [])
}

async function pruneFiles() {
  let dirsToPrune = getRecursiveDirectories(process.cwd(), levels)
  for (d in dirsToPrune) {
    let dir = dirsToPrune[d]
    await execute(dir)
  }
}

async function execute(dir) {
  console.log(`pruning files in ${dir}`)
  const r = await execa.shell(`node-prune ${dir}`, { stdio: 'inherit' })
  console.log('-------------------------\n')
}
