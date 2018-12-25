name :
	 Gzip
homepage :
	 https://www.gnu.org/software/gzip
url :
	 https://ftp.gnu.org/gnu/gzip/gzip-1.9.tar.gz
description :
	 Popular GNU data compression program
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
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
