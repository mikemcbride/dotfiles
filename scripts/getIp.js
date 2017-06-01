#!/usr/bin/env node

const os = require('os')
const internalIp = require('internal-ip')

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

console.log(getIp())