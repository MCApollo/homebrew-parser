name :
	 Libogg
homepage :
	 https://www.xiph.org/ogg/
url :
	 https://downloads.xiph.org/releases/ogg/libogg-1.3.3.tar.gz
description :
	 Ogg Bitstream Library
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['oggfile']
	 ['https://upload.wikimedia.org/wikipedia/commons/c/c8/Example.ogg']
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
