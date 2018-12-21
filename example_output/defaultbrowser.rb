name :
	 Defaultbrowser
homepage :
	 https://github.com/kerma/defaultbrowser
url :
	 https://github.com/kerma/defaultbrowser/archive/1.1.tar.gz
description :
	 Command-line tool for getting & setting the default browser
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}"
