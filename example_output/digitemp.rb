name :
	 Digitemp
homepage :
	 https://www.digitemp.com/
url :
	 https://github.com/bcl/digitemp/archive/v3.7.2.tar.gz
description :
	 Read temperature sensors in a 1-Wire net
build_deps :
link_deps :
	 libusb-compat
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir_p "build-serial/src"
	 mkdir_p "build-serial/userial/ds9097"
	 mkdir_p "build-serial/userial/ds9097u"
	 mkdir_p "build-usb/src"
	 mkdir_p "build-usb/userial/ds2490"
	 system "make", "-C", "build-serial", "-f", "../Makefile", "SRCDIR=..", "ds9097", "ds9097u"
	 system "make", "-C", "build-usb", "-f", "../Makefile", "SRCDIR=..", "ds2490"
	 bin.install "build-serial/digitemp_DS9097"
	 bin.install "build-serial/digitemp_DS9097U"
	 bin.install "build-usb/digitemp_DS2490"
	 man1.install "digitemp.1"
	 man1.install_symlink "digitemp.1" => "digitemp_DS9097.1"
	 man1.install_symlink "digitemp.1" => "digitemp_DS9097U.1"
	 man1.install_symlink "digitemp.1" => "digitemp_DS2490.1"
