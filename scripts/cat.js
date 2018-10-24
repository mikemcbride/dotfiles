#!/usr/bin/env node

// taken from https://github.com/paulirish/c-cli
const fs = require('fs')
const emphasize = require('emphasize')

const filePath = process.argv[2]
if (!filePath) {
    console.error('USAGE: c filename.ext')
    process.exit(1)
}

const doc = fs.readFileSync(filePath, 'utf8')
const output = emphasize.highlightAuto(doc).value

process.stdout.write(output)
