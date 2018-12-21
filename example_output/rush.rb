name :
	 Rush
homepage :
	 https://www.gnu.org/software/rush/
url :
	 https://ftp.gnu.org/gnu/rush/rush-1.8.tar.gz
description :
	 GNU's Restricted User SHell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
