#!/bin/sh

# Yet Another bhyve Script v0.2

name=win10
ram=2048M
cpu=2
disk=win10.img
media=Win10_1607_English_x64.iso
meidatype=cd
tap=tap42
fw=BHYVE_UEFI.fd
ip=127.0.0.1
port=5901
w=wait

bhyve \
	-c ${cpu} -m ${ram} \
	-H -w \
	-s 0,hostbridge \
	-s 1,ahci-${mediatype},${media} \
	-s 2,ahci-hd,${disk} \
	-s 4,virtio-net,${tap} \
	-s 8,fbuf,tcp=${ip}:${port},${w} \
	-s 16,xhci,tablet \
	-s 32,lpc \
	-l bootrom,${fw} \
	${name} &
