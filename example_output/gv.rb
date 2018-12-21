name :
	 Gv
homepage :
	 https://www.gnu.org/s/gv/
url :
	 https://ftp.gnu.org/gnu/gv/gv-3.7.4.tar.gz
description :
	 View and navigate through PostScript and PDF documents
build_deps :
	 pkg-config
link_deps :
	 ghostscript
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-SIGCHLD-fallback"
	 system "make", "install"
