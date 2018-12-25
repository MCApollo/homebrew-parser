name :
	 Clog
homepage :
	 https://taskwarrior.org/docs/clog/
url :
	 https://gothenburgbitfactory.org/download/clog-1.3.0.tar.gz
description :
	 Colorized pattern-matching log tail utility
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
