name :
	 BoostBuild
homepage :
	 https://www.boost.org/build/
url :
	 https://github.com/boostorg/build/archive/boost-1.68.0.tar.gz
description :
	 C++ build system
build_deps :
link_deps :
conflicts :
	 b2-tools
patches :
EOF_patch :
install :
	 system "./bootstrap.sh"
	 system "./b2", "--prefix=#{prefix}", "install"
