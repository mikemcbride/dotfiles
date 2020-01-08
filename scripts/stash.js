#!/usr/bin/env node

// invoke prune.sh in recursive directories.
// if an argument x is passed as a second parameter,
// it will traverse the directories x levels starting at cwd.
// otherwise, runs prune.sh in the current directory.
const fs = require('fs')
const path = require('path')
const execa = require('execa')


const levels = parseInt(process.argv[2], 10) || 1

stashFiles()

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
    .map(it => path.join(process.cwd(), it))
}

async function stashFiles() {
  let dirsToStash = getRecursiveDirectories(process.cwd(), levels)
  for (d in dirsToStash) {
    let dir = dirsToStash[d]
    await execute(process.cwd(), dir)
  }
}

async function execute(startDir, execDir) {
  process.chdir(execDir)
  console.log(`stashing changes in ${execDir}`)
  await execa('git', ['stash'])
  process.chdir(startDir)
}
