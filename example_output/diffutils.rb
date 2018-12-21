name :
	 Diffutils
homepage :
	 https://www.gnu.org/s/diffutils/
url :
	 https://ftp.gnu.org/gnu/diffutils/diffutils-3.6.tar.xz
description :
	 File comparison utilities
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
