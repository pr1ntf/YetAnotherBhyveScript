#!/bin/sh

# Prepare ssh tunnel (v0.2)

vncport=5901
sshport=4444
sshuser=pr1ntf
sshhost=192.168.42.24

ssh -L ${vncport}:127.0.0.1:${vncport} -p ${sshport} -N -f -l ${sshuser} ${sshhost}
