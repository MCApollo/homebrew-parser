name :
	 Vcdimager
homepage :
	 https://www.gnu.org/software/vcdimager/
url :
	 https://ftp.gnu.org/gnu/vcdimager/vcdimager-2.0.1.tar.gz
description :
	 (Super) video CD authoring solution
build_deps :
	 pkg-config
link_deps :
	 libcdio
	 popt
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
