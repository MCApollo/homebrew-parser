name :
	 Gsl
homepage :
	 https://www.gnu.org/software/gsl/
url :
	 https://ftp.gnu.org/gnu/gsl/gsl-2.5.tar.gz
description :
	 Numerical library for C and C++
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
	 system "make"
	 system "make", "install"
