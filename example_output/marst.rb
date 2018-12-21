name :
	 Marst
homepage :
	 https://www.gnu.org/software/marst
url :
	 https://ftp.gnu.org/gnu/marst/marst-2.7.tar.gz
description :
	 Algol-to-C translator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
