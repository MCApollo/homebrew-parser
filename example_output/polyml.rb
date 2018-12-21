name :
	 Polyml
homepage :
	 https://www.polyml.org/
url :
	 https://github.com/polyml/polyml/archive/v5.7.1.tar.gz
description :
	 Standard ML implementation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--disable-debug",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
