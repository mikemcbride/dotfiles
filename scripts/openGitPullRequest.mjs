#!/usr/bin/env node
import open from 'open'
const origin = process.argv[2]
const branch = process.argv[3]

// remove trailing '.git' from origin url
const url = origin.replace(/\.git$/gi, '')

// this is assuming GitHub
await open(`${url}/pull/new/${branch}`)
