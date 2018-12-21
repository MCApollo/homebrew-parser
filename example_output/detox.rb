name :
	 Detox
homepage :
	 https://detox.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/detox/detox/1.2.0/detox-1.2.0.tar.bz2
description :
	 Utility to replace problematic characters in filenames
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--mandir=#{man}", "--prefix=#{prefix}"
	 system "make"
	 (prefix/"etc").mkpath
	 pkgshare.mkpath
	 system "make", "install"
