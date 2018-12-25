name :
	 Editorconfig
homepage :
	 https://editorconfig.org/
url :
	 https://github.com/editorconfig/editorconfig-core-c/archive/v0.12.3.tar.gz
description :
	 Maintain consistent coding style between multiple editors
build_deps :
	 cmake
link_deps :
	 pcre2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}"
	 system "make", "install"
