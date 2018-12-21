name :
	 Hamlib
homepage :
	 https://hamlib.sourceforge.io/
url :
	 https://src.fedoraproject.org/repo/pkgs/hamlib/hamlib-1.2.15.3.tar.gz/3cad8987e995a00e5e9d360e2be0eb43/hamlib-1.2.15.3.tar.gz
description :
	 Ham radio control libraries
build_deps :
	 pkg-config
link_deps :
	 libtool
	 libusb-compat
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
