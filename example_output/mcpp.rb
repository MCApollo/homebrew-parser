name :
	 Mcpp
homepage :
	 https://mcpp.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/mcpp/mcpp/V.2.7.2/mcpp-2.7.2.tar.gz
description :
	 Alternative C/C++ preprocessor
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/3fd7fba/mcpp/2.7.2.patch
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--enable-mcpplib"
	 system "make", "install"
