name :
	 Cvsync
homepage :
	 https://www.cvsync.org/
url :
	 https://www.cvsync.org/dist/cvsync-0.24.19.tar.gz
description :
	 Portable CVS repository synchronization utility
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 ENV["MANDIR"] = man
	 ENV["CVSYNC_DEFAULT_CONFIG"] = etc/"cvsync.conf"
	 ENV["CVSYNCD_DEFAULT_CONFIG"] = etc/"cvsyncd.conf"
	 ENV["HASH_TYPE"] = "openssl"
	 inreplace "mk/network.mk",
	 /^CFLAGS \+= \-Dsocklen_t=int/, ""
	 inreplace "mk/base.mk",
	 /^INSTALL_(.{3})_OPTS\?=.*/, 'INSTALL_\1_OPTS?= -c -m ${\1MODE}'
	 bin.mkpath
	 lib.mkpath
	 man1.mkpath
	 system "make", "install"
