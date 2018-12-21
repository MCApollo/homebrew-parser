name :
	 Pk
homepage :
	 https://github.com/johnmorrow/pk
url :
	 https://github.com/johnmorrow/pk/releases/download/v1.0.2/pk-1.0.2.tar.gz
description :
	 Field extractor command-line utility
build_deps :
link_deps :
	 argp-standalone
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "test"
	 system "make", "install"
