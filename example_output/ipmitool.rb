name :
	 Ipmitool
homepage :
	 https://ipmitool.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ipmitool/ipmitool/1.8.18/ipmitool-1.8.18.tar.bz2
description :
	 Utility for IPMI control with kernel driver or LAN interface
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/adaugherity/87f1466b3c93d5aed205a636169d1c58/raw/29880afac214c1821e34479dad50dca58a0951ef/ipmitool-getpass-segfault.patch
EOF_patch :
install :
	 inreplace "lib/ipmi_cfgp.c", "#include <malloc.h>", ""
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --disable-intf-usb
	 ]
	 system "./configure", *args
	 system "make", "check"
	 system "make", "install"
