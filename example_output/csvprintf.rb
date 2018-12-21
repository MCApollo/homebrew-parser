name :
	 Csvprintf
homepage :
	 https://github.com/archiecobbs/csvprintf
url :
	 https://github.com/archiecobbs/csvprintf/archive/1.0.4.tar.gz
description :
	 Command-line utility for parsing CSV files
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "LDFLAGS", "-liconv"
	 system "./autogen.sh"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
