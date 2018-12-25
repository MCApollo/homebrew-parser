name :
	 Avfs
homepage :
	 https://avf.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/avf/avfs/1.0.5/avfs-1.0.5.tar.bz2
description :
	 Virtual file system that facilitates looking inside archives
build_deps :
	 pkg-config
link_deps :
	 :macos
	 openssl
	 :osxfuse
	 xz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git i/scripts/mountavfs w/scripts/mountavfs
	 index 5722dcd..a35e633 100755
	 --- i/scripts/mountavfs
	 +++ w/scripts/mountavfs
	 @@ -14,7 +14,7 @@ else
	 MntDir=${HOME}/.avfs
	 fi
	 -grep -qE "avfsd ${MntDir}" /proc/mounts || {
	 +grep -qE "avfsd.*${MntDir}" < <(mount) || {
	 if [ ! -e "$MntDir" ]; then
	 mkdir -p "$MntDir"
	 fi
	 diff --git i/scripts/umountavfs w/scripts/umountavfs
	 index 09dc629..a242c21 100644
	 --- i/scripts/umountavfs
	 +++ w/scripts/umountavfs
	 @@ -14,11 +14,11 @@ else
	 MntDir="${HOME}/.avfs"
	 fi
	 -grep -qE "${MntDir}.*avfsd" /proc/mounts && {
	 +grep -qE "avfsd.*${MntDir}" < <(mount) && {
	 echo unMounting AVFS on $MntDir...
	 if type -p fusermount > /dev/null 2>&1 ; then
	 fusermount -u -z "$MntDir"
	 else
	 -      umount -l "$MntDir"
	 +      umount "$MntDir"
	 fi
	 }
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --enable-fuse
	 --enable-library
	 --with-ssl=#{Formula["openssl"].opt_prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
