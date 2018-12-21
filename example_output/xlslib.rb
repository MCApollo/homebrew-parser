name :
	 Xlslib
homepage :
	 https://sourceforge.net/projects/xlslib
url :
	 https://downloads.sourceforge.net/project/xlslib/xlslib-package-2.5.0.zip
description :
	 C++/C library to construct Excel .xls files in code
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "xlslib"
	 system "autoreconf", "-i"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
