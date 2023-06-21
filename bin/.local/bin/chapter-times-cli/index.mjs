#!/usr/bin/env node

import { readdirSync } from 'fs'
import execa from 'execa'
import ms from 'ms'

const hour = ms('1h')
const min = ms('1m')
const sec = ms('1s')

function msToTimestamp(val) {
  // response should be like this:
  // HH:MM:SS.mmm
  const hours = Math.floor(val / hour).toString().padStart(2, '0')
  val = val - (hour * hours)
  const mins = Math.floor(val /min).toString().padStart(2, '0')
  val = val - (min * mins)
  const [secs, remainder] = (val / sec).toFixed(3).toString().split('.')
  return `${hours}:${mins}:${secs.padStart(2, '0')}.${remainder}`
}

(async () => {
  try {
    const mp3Files = readdirSync(process.cwd()).filter(file => file.endsWith('.mp3'))

    let dur = 0;

    for (let file of mp3Files) {
      const ts = msToTimestamp(dur)
      const chapterName = file.replace('.mp3', '')
      console.log(`${ts} ${chapterName}`)

      let res = await execa('ffprobe', [
        '-show_entries',
        'format=duration',
        '-of',
        'default=noprint_wrappers=1:nokey=1',
        `${file}`,
      ])
      dur += (parseFloat(res.stdout, 10) * 1000)
    }
  } catch (e) {
    console.error('failed to compile chapter times:', e)
  }
})()
