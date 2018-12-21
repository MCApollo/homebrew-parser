name :
	 Dxflib
homepage :
	 https://www.ribbonsoft.com/en/what-is-dxflib
url :
	 https://www.ribbonsoft.com/archives/dxflib/dxflib-2.5.0.0-1.src.tar.gz
description :
	 C++ library for parsing DXF files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
