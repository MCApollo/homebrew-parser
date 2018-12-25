name :
	 Unibilium
homepage :
	 https://github.com/mauke/unibilium
url :
	 https://github.com/mauke/unibilium/archive/v2.0.0.tar.gz
description :
	 Very basic terminfo library
build_deps :
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
