name :
	 Cairomm
homepage :
	 https://cairographics.org/cairomm/
url :
	 https://cairographics.org/releases/cairomm-1.12.2.tar.gz
description :
	 Vector graphics library with cross-device output support
build_deps :
	 pkg-config
link_deps :
	 cairo
	 libpng
	 libsigc++
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
