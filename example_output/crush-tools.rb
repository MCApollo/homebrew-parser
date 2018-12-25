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
optional_deps :
conflicts :
	 aggregate
	 num-utils
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
