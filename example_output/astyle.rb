name :
	 Astyle
homepage :
	 https://astyle.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/astyle/astyle/astyle%203.1/astyle_3.1_macos.tar.gz
description :
	 Source code beautifier for C, C++, C#, and Java
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 system "make", "CXX=#{ENV.cxx}", "-f", "../build/mac/Makefile"
	 bin.install "bin/astyle"
