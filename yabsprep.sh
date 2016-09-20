#!/bin/sh

# Prepare host for running bhyve guest (v0.2)

tap=tap42
bridge=bridge0

# Create the tap interface
ifconfig ${tap} create

# Attach interfaces
ifconfig ${bridge} addm ${tap}
