#!/usr/bin/env node

import execa from 'execa'
import isGit from 'is-git-repository'
import open from 'open'

if (isGit()) {
    const remoteOrigin = await execa('git', ['config', '--get', 'remote.origin.url'])
    const httpRegex = /http(s)?:\/\/(github|gitlab)\./gi
    const githubSshRegex = /git\@github\.com:/gi
    const gitlabSshRegex = /git\@gitlab\.com:/gi
    const wwtSshRegex = /git\@github\.wwt\.com:/gi
    const githubHttp = 'https://github.com/'
    const gitlabHttp = 'https://gitlab.com/'
    const wwtHttp = 'https://github.wwt.com/'
    const gitUrl = remoteOrigin.stdout.replace(/\.git$/gi, '') // remove trailing '.git' from url

    if (gitUrl.match(httpRegex)) {
        // it's already an http link, just open it.
        open(gitUrl)
    } else if (gitUrl.match(githubSshRegex)) {
        // public GitHub
        open(gitUrl.replace(githubSshRegex, githubHttp))
    } else if (gitUrl.match(gitlabSshRegex)) {
        // publig GitLab
        open(gitUrl.replace(gitlabSshRegex, gitlabHttp))
    } else if (gitUrl.match(wwtSshRegex)) {
        // WWT GitHub
        open(gitUrl.replace(wwtSshRegex, wwtHttp))
    }
} else {
    // not a git repo.
    console.log('`git-open` must be run inside of a directory that has been git initialized.')
}
