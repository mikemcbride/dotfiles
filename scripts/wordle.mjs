#!/usr/bin/env node

import words from '../wordle/wordlist.mjs'
const start = new Date('2021-06-19')
const today = new Date()
const index = Math.floor((today-start)/(1000*60*60*24))
console.log('todays word is:', words[index])
