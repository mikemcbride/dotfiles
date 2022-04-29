#!/usr/bin/env node

// smarter git-clone

import fs from 'node:fs'
import path from 'node:path'
import execa from 'execa'
import ora from 'ora'
import { green, red } from 'kleur/colors'
import simpleGit from 'simple-git'
import clipboard from 'clipboardy'

let cloneUrl = process.argv[2]

// this allows us to pass in a string like 'org/repo', or a fully qualified url.
let isWwt = process.argv.includes('--wwt') || process.argv[2].includes('github.wwt.com')
if (!cloneUrl.startsWith('https://')) {
  cloneUrl = `https://github.${isWwt ? 'wwt.' : ''}com/${cloneUrl}`
}
if (!cloneUrl.endsWith('.git')) {
  cloneUrl = `${cloneUrl}.git`
}

function getDirectories(srcpath) {
    return fs.readdirSync(srcpath).filter(file => fs.lstatSync(path.join(srcpath, file)).isDirectory())
}

const spinner = ora({
    text: '🐑 🐑 Cloning...',
    color: 'green'
}).start()

// get local directories so we can see which one we added in the clone
// unfortunately, simple-git does not return anything from the Promise after clone,
// so we have to manually infer which directory was created.
const dirsBefore = getDirectories(process.cwd())

// clone the repo
const git = simpleGit({ baseDir: process.cwd() })
await git.clone(cloneUrl)

// this should give us a single directory... the one that didn't exist before cloning
const dirsAfter = getDirectories(process.cwd()).filter(dir => !dirsBefore.includes(dir))

if (dirsAfter.length !== 1) {
    // either there was an issue cloning, or more than one directory has been added since we started.
    // not gonna try and mess with that.
    spinner.stop()
    console.log(red('Unable to clone repository.'))
    await clipboard.write(process.cwd())
    process.exit(1)
}

// just grab the first directory in the array
const newRepo = dirsAfter[0]

process.chdir(newRepo)

// if remote contains github.wwt.com, set the WWT git config user info
if (isWwt) {
    await execa('git', ['config', 'user.name', 'Mike McBride'])
    await execa('git', ['config', 'user.email', 'mike.mcbride@wwt.com'])
}

spinner.stop()

console.log(green('All done! Changing directories to your new repo so you can get started!'))
await clipboard.write(process.cwd())
