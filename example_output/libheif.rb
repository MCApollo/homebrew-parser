name :
	 Libheif
homepage :
	 https://www.libde265.org/
url :
	 https://github.com/strukturag/libheif/releases/download/v1.3.2/libheif-1.3.2.tar.gz
description :
	 ISO/IEC 23008-12:2017 HEIF file format decoder and encoder
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 libde265
	 libpng
	 x265
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install "examples/example.heic"
