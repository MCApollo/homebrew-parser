name :
	 FdkAacEncoder
homepage :
	 https://github.com/nu774/fdkaac
url :
	 https://github.com/nu774/fdkaac/archive/1.0.0.tar.gz
description :
	 Command-line encoder frontend for libfdk-aac
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 fdk-aac
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-i"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
