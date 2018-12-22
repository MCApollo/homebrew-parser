name :
	 Uriparser
homepage :
	 https://uriparser.github.io/
url :
	 https://github.com/uriparser/uriparser/releases/download/uriparser-0.9.0/uriparser-0.9.0.tar.bz2
description :
	 URI parsing library (strictly RFC 3986 compliant)
build_deps :
	 cmake
	 pkg-config
link_deps :
conflicts :
	 libkml
patches :
EOF_patch :
install :
	 (buildpath/"gtest").install resource("gtest")
	 (buildpath/"gtest/googletest").cd do
	 system "cmake", "."
	 system "make"
	 end
	 ENV["GTEST_CFLAGS"] = "-I./gtest/googletest/include"
	 ENV["GTEST_LIBS"] = "-L./gtest/googletest/ -lgtest"
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-doc"
	 system "make", "check"
	 system "make", "install"