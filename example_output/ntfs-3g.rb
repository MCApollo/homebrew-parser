name :
	 Ntfs3g
homepage :
	 https://www.tuxera.com/community/open-source-ntfs-3g/
url :
	 https://tuxera.com/opensource/ntfs-3g_ntfsprogs-2017.3.23.tgz
description :
	 Read-write NTFS driver for FUSE
build_deps :
	 pkg-config
link_deps :
	 gettext
	 :osxfuse
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e0b6faaa0d/ntfs-3g/10.13.patch
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-lintl"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --exec-prefix=#{prefix}
	 --mandir=#{man}
	 --with-fuse=external
	 ]
	 system "./autogen.sh" if build.head?
	 inreplace "ntfsprogs/Makefile.in", "/sbin", sbin
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 File.open("#{sbin}/mount_ntfs", File::CREAT|File::TRUNC|File::RDWR, 0755) do |f|
	 f.puts <<~EOS
	 #!/bin/bash
	 VOLUME_NAME="${@:$#}"
	 VOLUME_NAME=${VOLUME_NAME#/Volumes/}
	 USER_ID=#{Process.uid}
	 GROUP_ID=#{Process.gid}
	 if [ `/usr/bin/stat -f %u /dev/console` -ne 0 ]; then
	 USER_ID=`/usr/bin/stat -f %u /dev/console`
	 GROUP_ID=`/usr/bin/stat -f %g /dev/console`
	 fi
	 #{opt_bin}/ntfs-3g \\
	 -o volname="${VOLUME_NAME}" \\
	 -o local \\
	 -o negative_vncache \\
	 -o auto_xattr \\
	 -o auto_cache \\
	 -o noatime \\
	 -o windows_names \\
	 -o user_xattr \\
	 -o inherit \\
	 -o uid=$USER_ID \\
	 -o gid=$GROUP_ID \\
	 -o allow_other \\
	 "$@" >> /var/log/mount-ntfs-3g.log 2>&1
	 exit $?;
	 EOS
