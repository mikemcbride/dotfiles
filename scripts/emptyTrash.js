#!/usr/bin/env node

(async function () {
  const emptyTrash = require('empty-trash')
  const randomItem = require('random-item')
  const ora = require('ora')
  const chalk = require('chalk')
  
  const messages = [
    'Taking out the trash',
    'Scheduling trash pickup',
    'Calling the garbage man',
    'Leave it to me',
    "I'll clean that up for ya",
    'You got it boss'
  ]
  
  const message = randomItem(messages)
  const spinner = ora({
    text: message,
    color: 'green'
  }).start()
  
  await emptyTrash()
  
  spinner.stop()

  console.log(chalk.green('All done!'))
})()
