name :
	 Gaul
homepage :
	 https://gaul.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gaul/gaul-devel/0.1850-0/gaul-devel-0.1850-0.tar.gz
description :
	 Genetic Algorithm Utility Library
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
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-debug",
	 "--disable-g",
	 "--prefix=#{prefix}"
	 system "make", "install"
