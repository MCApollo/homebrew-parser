name :
	 Libstatgrab
homepage :
	 https://www.i-scream.org/libstatgrab/
url :
	 https://ftp.i-scream.org/pub/i-scream/libstatgrab/libstatgrab-0.91.tar.gz
description :
	 Provides cross-platform access to statistics about the system
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
