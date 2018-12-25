name :
	 Ohcount
homepage :
	 https://github.com/blackducksw/ohcount
url :
	 https://github.com/blackducksw/ohcount/archive/v3.1.1.tar.gz
description :
	 Source code line counter
build_deps :
link_deps :
	 libmagic
	 pcre
	 ragel
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./build", "ohcount"
	 bin.install "bin/ohcount"
