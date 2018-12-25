name :
	 Jpegoptim
homepage :
	 https://github.com/tjko/jpegoptim
url :
	 https://github.com/tjko/jpegoptim/archive/RELEASE.1.4.6.tar.gz
description :
	 Utility to optimize JPEG files
build_deps :
link_deps :
	 jpeg
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
	 ENV.deparallelize
	 system "make", "install"
