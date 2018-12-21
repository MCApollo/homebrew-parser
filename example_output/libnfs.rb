name :
	 Libnfs
homepage :
	 https://github.com/sahlberg/libnfs
url :
	 https://github.com/sahlberg/libnfs/archive/libnfs-2.0.0.tar.gz
description :
	 C client library for NFS
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./bootstrap"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
