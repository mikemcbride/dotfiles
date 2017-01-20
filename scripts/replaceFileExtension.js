#!/usr/bin/env node

(function () {
  const fs = require('fs')
  const path = require('path')
  
  const startingExt = '.' + process.argv[2]
  const finalExt = '.' + process.argv[3]
  
  if (startingExt === undefined || finalExt === undefined) {
    console.error('please provide a starting extension and new extension')
    return false
  }
  
  fs.readdirSync(process.cwd())
    .filter(it => path.extname(it) === startingExt)
    .forEach(it => {
      const currName = process.cwd() + '/' + it
      const newName = process.cwd() + '/' + path.basename(it, startingExt) + finalExt
      fs.renameSync(currName, newName)
    })
})()