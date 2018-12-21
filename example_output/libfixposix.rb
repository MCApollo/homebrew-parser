name :
	 Libfixposix
homepage :
	 https://github.com/sionescu/libfixposix
url :
	 https://github.com/sionescu/libfixposix/archive/v0.4.3.tar.gz
description :
	 Thin wrapper over POSIX syscalls
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
