name :
	 Libdvdcss
homepage :
	 https://www.videolan.org/developers/libdvdcss.html
url :
	 https://download.videolan.org/pub/videolan/libdvdcss/1.4.2/libdvdcss-1.4.2.tar.bz2
description :
	 Access DVDs as block devices without the decryption
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-if" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
