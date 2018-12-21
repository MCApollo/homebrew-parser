name :
	 Tundra
homepage :
	 https://github.com/deplinenoise/tundra
url :
	 https://github.com/deplinenoise/tundra/archive/v2.08.tar.gz
description :
	 Code build system that tries to be fast for incremental builds
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 (buildpath/"unittest/googletest").install resource("gtest")
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
