#!/bin/sh

# Remaster new ISO

folder=win2k8
iso=win2k8.iso

mkisofs \
	-b boot/etfsboot.com -no-emul-boot -c BOOT.CAT \
	-iso-level 4 -J -l -D \
	-N -joliet-long \
	-relaxed-filenames -v \
	-V "Custom" -udf \
	-boot-info-table -eltorito-alt-boot -eltorito-platform 0xEF \
	-eltorito-boot efi/microsoft/boot/efisys_noprompt.bin \
	-no-emul-boot \
	-o ${iso} ${folder}