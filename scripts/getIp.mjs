#!/usr/bin/env node

import os from 'node:os'
import { internalIpV4 } from 'internal-ip'
import { green, gray } from 'kleur/colors'
import boxen from 'boxen'
import clipboard from 'clipboardy'

const interfaces = os.networkInterfaces()

// first, check for VPN at utun0
let ip = interfaces?.utun0?.address

// If no ip, check for internal
if (!ip) {
    ip = await internalIpV4()
}

await clipboard.write(ip)
// (copied to clipboard) has 21 characters in it.
// to make the IP address centered, we need to pad it on the left.
// we have to figure out how many spaces to do...
const msg = green(ip) + gray('\n(copied to clipboard)')
const opts = {
    padding: 1,
    borderColor: 'blue',
    textAlignment: 'center'
}

console.log('\n' + boxen(msg, opts) + '\n')
