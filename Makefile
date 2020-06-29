all: clean prep cross-compiler cross-system download-all prep-rootfs chroot-tempsystem chroot-system chroot-clean

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

chroot-tempsystem:
	@sudo scripts/chrrun scripts/temp-system

chroot-system:
	@sudo scripts/chrrun scripts/system

chroot-clean:
	@sudo scripts/chrrun scripts/system-cleanup
