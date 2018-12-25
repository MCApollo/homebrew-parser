name :
	 TidyHtml5
homepage :
	 https://www.html-tidy.org/
url :
	 https://github.com/htacg/tidy-html5/archive/5.6.0.tar.gz
description :
	 Granddaddy of HTML tools, with support for modern standards
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
	 cd "build/cmake"
	 system "cmake", "../..", *std_cmake_args
	 system "make"
	 system "make", "install"
