name :
	 Lhasa
homepage :
	 https://fragglet.github.io/lhasa/
url :
	 https://github.com/fragglet/lhasa/archive/v0.3.1.tar.gz
description :
	 LHA implementation to decompress .lzh and .lzs archives
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
optional_deps :
conflicts :
	 lha
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh", "--prefix=#{prefix}"
	 system "make", "install"
