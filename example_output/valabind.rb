name :
	 Valabind
homepage :
	 https://radare.org/
url :
	 https://github.com/radare/valabind/archive/1.6.0.tar.gz
description :
	 Vala bindings for radare, reverse engineering framework
build_deps :
	 pkg-config
link_deps :
	 swig
	 vala
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
