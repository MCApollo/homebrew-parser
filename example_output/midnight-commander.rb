name :
	 MidnightCommander
homepage :
	 https://www.midnight-commander.org/
url :
	 https://www.midnight-commander.org/downloads/mc-4.8.21.tar.xz
description :
	 Terminal-based visual file manager
build_deps :
	 pkg-config
link_deps :
	 glib
	 libssh2
	 openssl
	 s-lang
optional_deps :
conflicts :
	 minio-mc
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --without-x
	 --with-screen=slang
	 --enable-vfs-sftp
	 ]
	 ENV["ac_cv_func_utimensat"] = "no" if MacOS.version >= :high_sierra
	 system "./configure", *args
	 system "make", "install"
