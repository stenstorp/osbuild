# OSBuild
A Linux rootfs builder based on Linux from Scratch.

## How to:
1. Edit the `config` file and change `ARCH` to your desired target architecture.  
1.1. You may want to change the `TARGET` variable depending on your chosen architecture.  
2. Run `make versioncheck` and ensure all dependencies are installed.  
3. Run `make rootfs` to create a compressed root filesystem. This WILL take a long time especially if compiling for a different architecture.  
3.1. To update, run `git pull && make local` ONLY if you are currently booted into the system  

## Other notes:
- To build a specific component, run `scripts/build [STAGE] [COMPONENT]`  
- Tested on i686 and x86_64 using legacy BIOS and UEFI. Not tested on powerpc(64) or arm/aarch64.

## Installing:
1. Partition the drive with at least a root filesystem for BIOS systems or an EFI partition and a root partition for UEFI systems.
2. Extract the compiled `rootfs_ARCH_VERSION.tar.xz` file into the root filesystem with:  
	`tar --acls --xattrs -xpf rootfs_ARCH_VERSION.tar.xz`
3. Mount the `dev` `sys` `proc` and `run` virtual filesystems with:  
	`mount --bind /dev ./dev`  
	`mount -t sysfs sysfs ./sys`  
	`mount -t proc proc ./proc`  
	`mount -t tmpfs tmpfs ./run`  

	If you are installing for a UEFI system, mount the EFI partition on `./boot/efi`
4. Chroot into the root filesystem with: `chroot .`  
  
	4.1. If you are installing for a UEFI system, mount the EFI variables with:  
		`mount -t efivarfs efivarfs /sys/firmware/efi/efivars/`
  
5. Set the root password with `passwd`
6. Install grub with `grub-install /dev/sdX` where `sdX` is the drive you are installing to.  
	(If you are installing for a BIOS system from a UEFI system, you may need to run:  
`grub-install --target=i386-pc /dev/sdX` instead. You cannot install for a UEFI system from a BIOS system.)
7. Create the grub configuration file with: `grub-mkconfig -o /boot/grub/grub.cfg`
8. Perform any other desired configuration.
9. Exit from the chroot with `exit` and unmount the virtual filesystems with:  
	`umount ./dev`  
	`umount ./proc`  
	`umount ./run`  
	`umount ./sys`  
10. Run `sync` to ensure all files have been copied successfully. That drive sould now be bootable!
