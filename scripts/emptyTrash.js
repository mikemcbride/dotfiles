#!/usr/bin/env node

(async function () {
  const emptyTrash = require('empty-trash')
  const ora = require('ora')
  const chalk = require('chalk')
  
  const spinner = ora({
    text: 'Emptying trash...',
    color: 'green'
  }).start()
  
  await emptyTrash()
  
  spinner.stop()
  
  console.log(
    chalk.green('All done taking out the trash 👍')
  )
})()
