name :
	 MmCommon
homepage :
	 https://www.gtkmm.org/
url :
	 https://download.gnome.org/sources/mm-common/0.9/mm-common-0.9.12.tar.xz
description :
	 Build utilities for C++ interfaces of GTK+ and GNOME packages
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-silent-rules", "--prefix=#{prefix}"
	 system "make", "install"
