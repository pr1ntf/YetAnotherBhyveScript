#!/bin/sh

# Yet Another bhyve Script v0.1

name=win2k8
ram=1024M
cpu=1
disk=win2k8.img
iso=win2k8.iso
tap=tap0
mac=02:03:05:08:13:21
con=stdio
fw=BHYVE_UEFI_20151002.fd

bhyve \
	-c ${cpu} -m ${ram} \
	-H -w \
	-s 0,hostbridge \
	-s 3,ahci-hd,${disk} \
	-s 4,ahci-cd,${iso} \
	-s 5,virtio-net,${tap},mac=${mac} \
	-s 31,lpc \
	-l com1,${con} \
	-l bootrom,${fw} \
	${name}
