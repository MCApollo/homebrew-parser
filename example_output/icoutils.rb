name :
	 Icoutils
homepage :
	 https://www.nongnu.org/icoutils/
url :
	 https://savannah.nongnu.org/download/icoutils/icoutils-0.32.3.tar.bz2
description :
	 Create and extract MS Windows icons and cursors
build_deps :
link_deps :
	 libpng
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-rpath",
	 "--prefix=#{prefix}"
	 system "make", "install"
