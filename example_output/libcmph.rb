name :
	 Libcmph
homepage :
	 https://cmph.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/cmph/cmph/cmph-2.0.tar.gz
description :
	 C minimal perfect hashing library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
