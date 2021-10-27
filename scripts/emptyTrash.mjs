#!/usr/bin/env node

import emptyTrash from 'empty-trash'
import ora from 'ora'
import { green } from 'kleur/colors'

const spinner = ora('brb, taking out the trash').start()
await emptyTrash()
spinner.stop()
console.log(green('All done!'))
