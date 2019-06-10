#!/usr/bin/env node

(function openGitPullRequest() {
  const open = require('open')
  const origin = process.argv[2]
  const branch = process.argv[3]
  
  const url = origin.replace(/\.git$/gi, '') // remove trailing '.git' from origin url
  
  open(`${url}/pull/new/${branch}`) // this is assuming GitHub...
})()