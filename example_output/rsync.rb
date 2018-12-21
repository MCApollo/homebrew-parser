name :
	 Rsync
homepage :
	 https://rsync.samba.org/
url :
	 https://rsync.samba.org/ftp/rsync/rsync-3.1.3.tar.gz
description :
	 Utility that provides fast incremental file transfer
build_deps :
	 autoconf
link_deps :
conflicts :
patches :
	 https://download.samba.org/pub/rsync/src/rsync-patches-3.1.3.tar.gz
	 https://raw.githubusercontent.com/Homebrew/formula-patches/344bf3b/rsync/fix-crtimes-patch-3.1.3.diff
EOF_patch :
install :
	 system "./prepare-source"
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--with-rsyncd-conf=#{etc}/rsyncd.conf",
	 "--enable-ipv6"
	 system "make"
	 system "make", "install"
