name :
	 Libqalculate
homepage :
	 https://qalculate.github.io/
url :
	 https://github.com/Qalculate/libqalculate/releases/download/v2.8.2/libqalculate-2.8.2.tar.gz
description :
	 Library for Qalculate! program
build_deps :
	 intltool
	 pkg-config
link_deps :
	 gettext
	 gnuplot
	 mpfr
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--without-icu",
	 "--prefix=#{prefix}"
	 system "make", "install"
