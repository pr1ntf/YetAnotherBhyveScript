A set of scripts to create an unattended Windows installation ISO, 
and boot it using FreeBSD's bhyve via UEFI firmware.

These scripts are drawn on the knowledge obtained from the 
bhyve/Windows wiki page on freebsd.org:
https://wiki.freebsd.org/bhyve/Windows

You must create the network tap and load the VMM kernel module.
More information on that in the handbook:
https://www.freebsd.org/doc/handbook/virtualization-host-bhyve.html

You must provide your own Windows and VirtIO ISO's.

VirtIO drivers can be downloaded from:
fetch https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.96/virtio-win-0.1.96.iso

Windows Vista needs an older driver:
fetch https://fedorapeople.org/groups/virt/virtio-win/deprecated-isos/archives/virtio-win-0.1-94/virtio-win-0.1-94.iso

Provide your path to your Windows and VirtIO ISO's in extract.sh
You may also provide a name for the output folder. 

Edit your AutoUnattend.xml file and add it to the output folder.
You can find examples at:
git clone https://github.com/nahanni/bhyve-windows-unattend-xml
 
Edit remaster.sh accordingly and run it to create a new ISO.

Now you can edit yabs.sh with the variables and paths you need and run.
You can find firmware at:
fetch https://people.freebsd.org/~grehan/bhyve_uefi/BHYVE_UEFI_20151002.fd

You can create a new disk image by running the following:
truncate -s 32G win2k8.img

After the first run of yabs.sh, you must edit the script so that
it mounts the null.iso (A requirment of Windows + UEFI Firmware).

You must run yabs.sh a second time for the second phase of install.

After it exits, you can run it a third time. 
It will do a third install phase then boot to a usuable OS.
