name :
	 Lolcode
homepage :
	 https://lolcode.org/
url :
	 https://github.com/justinmeza/lci/archive/v0.11.2.tar.gz
description :
	 Esoteric programming language
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
	 lci
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", "."
	 system "make"
	 bin.install "lci"
