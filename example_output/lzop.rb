name :
	 Lzop
homepage :
	 https://www.lzop.org/
url :
	 https://dl.bintray.com/homebrew/mirror/lzop-1.04.tar.gz
description :
	 File compressor
build_deps :
link_deps :
	 lzo
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
