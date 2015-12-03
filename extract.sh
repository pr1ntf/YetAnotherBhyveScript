#!/bin/sh

# Extract important stuff to remaster folder

folder=win2k8
iso=Win2k8R2.iso
drivers=virtio-win-0.1-94.iso

mkdir -p ${folder}/virtio

7z x ${iso} -o${folder}

tar xf $drivers -C ${folder}/virtio
