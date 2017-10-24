#!/usr/bin/env node

const spawn = require('child_process').spawn
const os = require('os')
const internalIp = require('internal-ip')
const chalk = require('chalk')
const boxen = require('boxen')

function getIp() {
  const interfaces = os.networkInterfaces()

  let ip = null
  // Check for VPN
  if (interfaces.utun0) {
    ip = interfaces.utun0.address
  }
  // Check for internal
  if (!ip) {
    ip = internalIp.v4()
  }
  
  return ip
}

function pbcopy(data) {
  const proc = spawn('pbcopy') 
  proc.stdin.write(data)
  proc.stdin.end()
}

const ip = getIp()
pbcopy(ip)

const msg = '     ' + chalk.green(ip) + chalk.gray('\n(copied to clipboard)')
const opts = {
  padding: 1,
  borderColor: 'blue'
}

console.log('\n' + boxen(msg, opts) + '\n')
