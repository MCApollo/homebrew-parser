name :
	 Jpeg
homepage :
	 https://www.ijg.org/
url :
	 https://www.ijg.org/files/jpegsrc.v9c.tar.gz
description :
	 Image manipulation library
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
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
