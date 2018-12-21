name :
	 Mpfr
homepage :
	 https://www.mpfr.org/
url :
	 https://ftp.gnu.org/gnu/mpfr/mpfr-4.0.1.tar.xz
description :
	 C library for multiple-precision floating-point computations
build_deps :
link_deps :
	 gmp
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}",
	 "--disable-silent-rules"
	 system "make"
	 system "make", "check"
	 system "make", "install"
