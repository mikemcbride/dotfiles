#!/usr/bin/env node

/*
  Run this in any directory and provide the following arguments:
  1. remoteType: ssh or https
  2. levels: how many levels deep your repositories start from that directory.
    - for example: if all your git repos are in ~/src, you will run it with 0 from the ~/src directory
    - if you have something like ~/src and then a set of org folders, which each contain repos, pass 1 to tell it to go one level deeper
*/

const fs = require('fs')
const path = require('path')
const execa = require('execa')
const ora = require('ora')
const simpleGit = require('simple-git/promise')
const isGitRepo = require('is-git-repository')

const remoteType = process.argv[2] || 'https' // should be ssh or https. defaults to https
const levels = process.argv[3] || 0 // how many levels deeper to go. defaults to 0 (all repos are in current directory)
const ignoreDirs = ['node_modules', '.git', 'bower_components']
const spinner = ora('Updating remotes...').start()

let dirs = []

// populate dirs
getDirsRecursive(process.cwd(), 0)

// dirs is now populated
updateRemotes(dirs[levels])

function updateRemotes(dirs) {
  dirs.forEach(async function (dir) {
    if (isGitRepo(dir)) {
      let remote = await getRemote(dir)
      if (getRemoteType(remote) !== remoteType) {
        remote = convertRemote(remote, remoteType)
        updateRemote(dir, remote)
      }
    }
  })  
}

async function getRemote(dir) {
  const git = simpleGit(dir)
  let remote = await git.listRemote(['--get-url'])
  return remote
}

function getRemoteType(remote) {
  return remote.indexOf('http') !== 0 ? 'ssh' : 'https'
}

function convertRemote(remote, toType) {
  let newRemote = remote.trim()
  
  switch (toType) {
    case 'ssh':
      // convert https:// to git@
      newRemote = newRemote.replace(/^https:\/\//gi, 'git@')
      // convert .com/ to .com:
      newRemote = newRemote.replace(/\.com\//i, '.com:')
      break
    case 'https':
    default:
      // convert git@ to https://
      newRemote = newRemote.replace(/^git@/gi, 'https://')
      // convert .com: to .com/
      newRemote = newRemote.replace(/\.com:/i, '.com/')
      break
  }

  return newRemote
}

async function updateRemote(dir, remote) {
  const git = simpleGit(dir)
  await git.removeRemote('origin')
  await git.addRemote('origin', remote)
  
  // TODO: this should work, but for some reason the command is saying no upstream found for origin/master
  // When I cd into a directory and run the same thing, it works just fine.
  await execa('cd', [dir, '&&', 'git', 'checkout', 'master', '&&', 'git', 'branch', '-u', 'origin/master'])
}

spinner.stop()



function getDirectories(srcpath) {
  return fs.readdirSync(srcpath)
    .filter(file => fs.lstatSync(path.join(srcpath, file)).isDirectory())
    .filter(dir => !ignoreDirs.includes(dir))
    .map(dir => srcpath + '/' + dir)
}

function getDirsRecursive(dir, level) {
  const tmpDirs = getDirectories(dir)
  const dirLevel = dirs[level] || []
  dirs[level] = [...dirLevel, ...tmpDirs]
  
  level++
  
  if (level <= levels) {
    // not there yet. get another one!
    tmpDirs.forEach(d => {
      getDirsRecursive(d, level)
    })
  }
}