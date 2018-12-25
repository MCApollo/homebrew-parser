name :
	 Hercules
homepage :
	 http://www.hercules-390.eu/
url :
	 http://downloads.hercules-390.eu/hercules-3.13.tar.gz
description :
	 System/370, ESA/390 and z/Architecture Emulator
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
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-optimization=no"
	 system "make"
	 system "make", "install"
	 pkgshare.install "hercules.cnf"
