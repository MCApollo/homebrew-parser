name :
	 Libtool
homepage :
	 https://www.gnu.org/software/libtool/
url :
	 https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
description :
	 Generic library support script
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["SED"] = "sed"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--program-prefix=g",
	 "--enable-ltdl-install"
	 system "make", "install"
