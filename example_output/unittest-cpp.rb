name :
	 UnittestCpp
homepage :
	 https://github.com/unittest-cpp/unittest-cpp
url :
	 https://github.com/unittest-cpp/unittest-cpp/releases/download/v2.0.0/unittest-cpp-2.0.0.tar.gz
description :
	 Unit testing framework for C++
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
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--disable-silent-rules"
	 system "make", "install"
