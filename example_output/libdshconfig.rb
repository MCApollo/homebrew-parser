name :
	 Libdshconfig
homepage :
	 https://www.netfort.gr.jp/~dancer/software/dsh.html.en
url :
	 https://www.netfort.gr.jp/~dancer/software/downloads/libdshconfig-0.20.13.tar.gz
description :
	 Distributed shell library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
