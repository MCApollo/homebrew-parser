name :
	 Flake
homepage :
	 https://flake-enc.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/flake-enc/flake/0.11/flake-0.11.tar.bz2
description :
	 FLAC audio encoder
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--disable-debug", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
