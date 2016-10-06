#!/bin/sh

# Prepare host for running bhyve (v0.2)

iface=em0
bridge=bridge0

# Load kernel module
kldload vmm
kldload if_tap
kldload if_bridge

# Set sysctl
sysctl net.link.tap.up_on_open=1

# Create bridge
ifconfig ${bridge} create

# Attach interfaces
ifconfig ${bridge} addm ${iface}

# Bring up bridge
ifconfig ${bridge} up
