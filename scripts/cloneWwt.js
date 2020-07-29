#!/usr/bin/env node

// smarter git-clone

const fs = require('fs')
const path = require('path')
const execa = require('execa')
const ora = require('ora')
const chalk = require('chalk')
const simpleGit = require('simple-git/promise')
const clipboard = require('clipboardy')

let [orgName, repoName] = getRepoAndOrgNames(process.argv[2])

const spinner = ora({
  text: 'Cloning...',
  color: 'green'
}).start()

return cloneRepo().then(res => {
  console.log(chalk.green('All done! Changing directories to your new repo so you can get started!'))
  clipboard.writeSync(res)
  return
})

function getRepoAndOrgNames(input) {
  let orgName = 'custom-apps'
  let repoName = input
  let orgRepo = repoName.split('/')
  if (orgRepo[1]) {
    orgName = orgRepo[0]
    repoName = orgRepo[1]
  }

  return [orgName, repoName]
}

async function cloneRepo() {
  // get local directories so we can see which one we added in the clone
  // unfortunately, simple-git does not return anything from the Promise after clone,
  // so we have to manually infer which directory was created.
  const dirsBefore = getDirectories(process.cwd())

  // clone the repo
  const cloneUrl = `https://github.wwt.com/${orgName}/${repoName}.git`
  await clone(cloneUrl)

  // this should give us a single directory... the one that didn't exist before cloning
  const dirsAfter = getDirectories(process.cwd()).filter(dir => !dirsBefore.includes(dir))

  let newRepo
  if (dirsAfter.length !== 1) {
    // either there was an issue cloning, or more than one directory has been added since we started.
    // not gonna try and mess with that.
    spinner.stop()
    console.log(chalk.red('Unable to clone repository.'))
    return process.cwd()
  }

  // just grab the first directory in the array
  newRepo = dirsAfter[0]
  
  process.chdir(newRepo)
  
  setWwtRemoteInfo()
  spinner.stop()
  return process.cwd()
}

async function clone(remote) {
  const git = simpleGit(process.cwd())
  await git.silent(true).clone(remote)
  return
}

function getDirectories(srcpath) {
  return fs.readdirSync(srcpath)
    .filter(file => fs.lstatSync(path.join(srcpath, file)).isDirectory())
}

async function setWwtRemoteInfo() {
  await execa('git', ['config', 'user.name', 'Mike McBride'])
  await execa('git', ['config', 'user.email', 'mike.mcbride@wwt.com'])
  return
}

