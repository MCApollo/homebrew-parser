name :
	 Epsilon
homepage :
	 https://epsilon-project.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/epsilon-project/epsilon/0.9.2/epsilon-0.9.2.tar.gz
description :
	 Powerful wavelet image compressor
build_deps :
link_deps :
	 popt
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
