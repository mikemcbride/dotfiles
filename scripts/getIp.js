#!/usr/bin/env node

const os = require('os')
const internalIp = require('internal-ip')
const chalk = require('chalk')
const boxen = require('boxen')
const clipboardy = require('clipboardy')

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

const ip = getIp()
clipboardy.writeSync(ip)

const msg = '     ' + chalk.green(ip) + chalk.gray('\n(copied to clipboard)')
const opts = {
  padding: 1,
  borderColor: 'blue'
}

console.log('\n' + boxen(msg, opts) + '\n')
