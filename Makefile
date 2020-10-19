all:
	@echo "Please specify rootfs or local"

rootfs: clean prep cross-compiler cross-system download-all prep-rootfs chroot-tempsystem chroot-system chroot-clean compress

local: clean temp-system system

versioncheck:
	@scripts/version-check

clean:
	@scripts/clean

cleanall:
	@scripts/clean all

prep:
	@scripts/rootfs cross-compiler

cross-compiler:
	@scripts/cross-compiler

cross-system:
	@scripts/cross-system

download-all:
	@scripts/download `ls components`

prep-rootfs:
	@sudo scripts/mkvfs
	@sudo scripts/chrrun scripts/rootfs system

temp-system:
	@scripts/temp-system

system:
	@scripts/system

xorg:
	@scripts/xorg

chroot-tempsystem:
	@sudo scripts/chrrun scripts/temp-system

chroot-system:
	@sudo scripts/chrrun scripts/system

chroot-xorg:
	@sudo scripts/chrrun scripts/xorg

chroot-clean:
	@sudo scripts/chrrun scripts/system-cleanup

compress:
	@sudo scripts/compress
