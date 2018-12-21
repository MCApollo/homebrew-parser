name :
	 Spandsp
homepage :
	 https://www.soft-switch.org/
url :
	 https://www.soft-switch.org/downloads/spandsp/spandsp-0.0.6.tar.gz
description :
	 DSP functions library for telephony
build_deps :
link_deps :
	 libtiff
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
