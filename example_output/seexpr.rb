name :
	 Seexpr
homepage :
	 https://www.disneyanimation.com/technology/seexpr.html
url :
	 https://github.com/wdas/SeExpr/archive/v2.11.tar.gz
description :
	 Embeddable expression evaluation engine
build_deps :
	 cmake
	 doxygen
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "doc"
	 system "make", "install"
