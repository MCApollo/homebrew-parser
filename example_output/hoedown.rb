name :
	 Hoedown
homepage :
	 https://github.com/hoedown/hoedown
url :
	 https://github.com/hoedown/hoedown/archive/3.0.7.tar.gz
description :
	 Secure Markdown processing (a revived fork of Sundown)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "hoedown"
	 bin.install "hoedown"
	 prefix.install "test"
