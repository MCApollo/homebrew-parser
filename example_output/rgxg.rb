name :
	 Rgxg
homepage :
	 https://rgxg.github.io
url :
	 https://github.com/rgxg/rgxg/releases/download/v0.1.1/rgxg-0.1.1.tar.gz
description :
	 C library and command-line tool to generate (extended) regular expressions
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
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
