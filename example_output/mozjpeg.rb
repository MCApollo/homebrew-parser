name :
	 Mozjpeg
homepage :
	 https://github.com/mozilla/mozjpeg
url :
	 https://github.com/mozilla/mozjpeg/archive/v3.3.1.tar.gz
description :
	 Improved JPEG encoder
build_deps :
	 autoconf
	 automake
	 libtool
	 nasm
	 pkg-config
link_deps :
optional_deps :
	 libpng
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--with-jpeg8"
	 system "make", "install"
