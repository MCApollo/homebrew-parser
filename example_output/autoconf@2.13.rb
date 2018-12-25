name :
	 AutoconfAT213
homepage :
	 https://www.gnu.org/software/autoconf/
url :
	 https://ftp.gnu.org/gnu/autoconf/autoconf-2.13.tar.gz
description :
	 Automatic configure script builder
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--program-suffix=213",
	 "--prefix=#{prefix}",
	 "--infodir=#{pkgshare}/info",
	 "--datadir=#{pkgshare}"
	 system "make", "install"
