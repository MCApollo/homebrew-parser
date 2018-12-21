name :
	 LcdfTypetools
homepage :
	 https://www.lcdf.org/type/
url :
	 https://www.lcdf.org/type/lcdf-typetools-2.107.tar.gz
description :
	 Manipulate OpenType and multiple-master fonts
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--without-kpathsea"
	 system "make", "install"
