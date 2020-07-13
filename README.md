# osbuild
A Linux rootfs builder based on Linux from Scratch

## How to:
1. Edit the `config` file and change `ARCH` to your desired target architecture.  
1.1. You may want to change the `TARGET` variable depending on your chosen architecture.  
2. Run `make versioncheck` and ensure all dependencies are installed.  
3. Run `make rootfs` to create a compressed root filesystem. This WILL take a long time especially if compiling for a different architecture.  
3.1. To update, run `git pull && make local` ONLY if you are currently booted into the system  

## Other notes:
- To build a specific component, run `scripts/build [STAGE] [COMPONENT]`  
- Tested on i686 and x86_64 using legacy BIOS. Not tested on UEFI, powerpc(64) or arm/aarch64.