name :
	 Yafc
homepage :
	 https://github.com/sebastinas/yafc
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/y/yafc/yafc_1.3.7.orig.tar.xz
description :
	 Command-line FTP client
build_deps :
	 pkg-config
link_deps :
	 libssh
	 readline
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --with-readline=#{Formula["readline"].opt_prefix}
	 ]
	 system "./configure", *args
	 system "make", "install"
