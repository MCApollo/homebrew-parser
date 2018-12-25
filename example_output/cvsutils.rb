name :
	 Cvsutils
homepage :
	 https://www.red-bean.com/cvsutils/
url :
	 https://www.red-bean.com/cvsutils/releases/cvsutils-0.2.6.tar.gz
description :
	 CVS utilities for use in working directories
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
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
