name :
	 Par2
homepage :
	 https://github.com/Parchive/par2cmdline
url :
	 https://github.com/Parchive/par2cmdline/releases/download/v0.8.0/par2cmdline-0.8.0.tar.bz2
description :
	 Parchive: Parity Archive Volume Set for data recovery
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
