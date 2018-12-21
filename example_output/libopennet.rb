name :
	 Libopennet
homepage :
	 https://www.rkeene.org/oss/libopennet
url :
	 https://www.rkeene.org/files/oss/libopennet/libopennet-0.9.9.tar.gz
description :
	 open_net(), similar to open()
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make"
	 system "make", "install"
