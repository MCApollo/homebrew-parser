name :
	 Glyr
homepage :
	 https://github.com/sahib/glyr
url :
	 https://github.com/sahib/glyr/archive/1.0.10.tar.gz
description :
	 Music related metadata search engine with command-line interface and C API
build_deps :
	 cmake
	 pkg-config
link_deps :
	 gettext
	 glib
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
