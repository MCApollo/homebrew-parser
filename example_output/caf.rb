name :
	 Caf
homepage :
	 https://actor-framework.org/
url :
	 https://github.com/actor-framework/actor-framework/archive/0.16.2.tar.gz
description :
	 Implementation of the Actor Model for C++
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--no-examples",
	 "--build-static", "--no-opencl"
	 system "make"
	 system "make", "test"
	 system "make", "install"
