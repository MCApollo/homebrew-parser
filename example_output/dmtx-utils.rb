name :
	 DmtxUtils
homepage :
	 https://github.com/dmtx/dmtx-utils
url :
	 https://github.com/dmtx/dmtx-utils/archive/v0.7.6.tar.gz
description :
	 Read and write data matrix barcodes
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 imagemagick
	 libdmtx
	 libtool
optional_deps :
conflicts :
resource :
	 ['test_image12']
	 ['https://raw.githubusercontent.com/dmtx/libdmtx/ca9313f/test/rotate_test/images/test_image12.png']
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
