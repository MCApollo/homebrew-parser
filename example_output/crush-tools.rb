name :
	 CrushTools
homepage :
	 https://github.com/google/crush-tools
url :
	 https://github.com/google/crush-tools/releases/download/20150716/crush-tools-20150716.tar.gz
description :
	 Command-line tools for processing delimited text data
build_deps :
link_deps :
	 pcre
conflicts :
	 aggregate
	 num-utils
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
