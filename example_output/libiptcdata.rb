name :
	 Libiptcdata
homepage :
	 https://libiptcdata.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/libiptcdata/libiptcdata/1.0.4/libiptcdata-1.0.4.tar.gz
description :
	 Virtual package provided by libiptcdata0
build_deps :
link_deps :
	 gettext
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
