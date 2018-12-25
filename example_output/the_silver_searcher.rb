name :
	 TheSilverSearcher
homepage :
	 https://github.com/ggreer/the_silver_searcher
url :
	 https://github.com/ggreer/the_silver_searcher/archive/2.2.0.tar.gz
description :
	 Code-search similar to ack
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 pcre
	 xz
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 bash_completion.install "ag.bashcomp.sh"
