name :
	 Bsdconv
homepage :
	 https://github.com/buganini/bsdconv
url :
	 https://github.com/buganini/bsdconv/archive/11.5.tar.gz
description :
	 Charset/encoding converter library
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
	 system "make", "PREFIX=#{prefix}"
	 system "make", "PREFIX=#{prefix}", "install"
