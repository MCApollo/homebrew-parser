name :
	 Jpeginfo
homepage :
	 https://www.kokkonen.net/tjko/projects.html
url :
	 https://www.kokkonen.net/tjko/src/jpeginfo-1.6.1.tar.gz
description :
	 Prints information and tests integrity of JPEG/JFIF files
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
	 ENV.deparallelize
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
