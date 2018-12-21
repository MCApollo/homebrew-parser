name :
	 LibvoAacenc
homepage :
	 https://opencore-amr.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/opencore-amr/vo-aacenc/vo-aacenc-0.1.3.tar.gz
description :
	 VisualOn AAC encoder library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
