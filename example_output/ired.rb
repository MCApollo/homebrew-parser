name :
	 Ired
homepage :
	 https://github.com/radare/ired
url :
	 https://github.com/radare/ired/archive/0.6.tar.gz
description :
	 Minimalistic hexadecimal editor designed to be used in scripts
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
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
