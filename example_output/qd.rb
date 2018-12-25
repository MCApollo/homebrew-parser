name :
	 Qd
homepage :
	 https://crd.lbl.gov/~dhbailey/mpdist/
url :
	 https://crd.lbl.gov/~dhbailey/mpdist/qd-2.3.21.tar.gz
description :
	 C++/Fortran-90 double-double and quad-double package
build_deps :
link_deps :
	 gcc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--enable-shared",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
