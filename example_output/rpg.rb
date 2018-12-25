name :
	 Rpg
homepage :
	 https://github.com/rtomayko/rpg
url :
	 https://github.com/downloads/rtomayko/rpg/rpg-0.3.0.tar.gz
description :
	 Ruby package management for UNIX
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
	 system "make"
	 system "make", "install"
