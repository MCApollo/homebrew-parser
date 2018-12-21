name :
	 Libmpc
homepage :
	 http://www.multiprecision.org/mpc/
url :
	 https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
description :
	 C library for the arithmetic of high precision complex numbers
build_deps :
link_deps :
	 gmp
	 mpfr
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --with-gmp=#{Formula["gmp"].opt_prefix}
	 --with-mpfr=#{Formula["mpfr"].opt_prefix}
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "check"
	 system "make", "install"
