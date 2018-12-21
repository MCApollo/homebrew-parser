name :
	 Diction
homepage :
	 https://www.gnu.org/software/diction/
url :
	 https://ftp.gnu.org/gnu/diction/diction-1.11.tar.gz
description :
	 GNU diction and style
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
