name :
	 Ratfor
homepage :
	 http://www.dgate.org/ratfor/
url :
	 http://www.dgate.org/ratfor/tars/ratfor-1.03.tar.gz
description :
	 Rational Fortran
build_deps :
link_deps :
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
