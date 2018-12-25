name :
	 Libcsv
homepage :
	 https://sourceforge.net/projects/libcsv/
url :
	 https://downloads.sourceforge.net/project/libcsv/libcsv/libcsv-3.0.3/libcsv-3.0.3.tar.gz
description :
	 CSV library in ANSI C89
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
