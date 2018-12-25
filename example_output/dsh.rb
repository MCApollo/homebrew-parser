name :
	 Dsh
homepage :
	 https://www.netfort.gr.jp/~dancer/software/dsh.html.en
url :
	 https://www.netfort.gr.jp/~dancer/software/downloads/dsh-0.25.10.tar.gz
description :
	 Dancer's shell, or distributed shell
build_deps :
link_deps :
	 libdshconfig
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
