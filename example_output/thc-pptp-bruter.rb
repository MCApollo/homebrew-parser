name :
	 ThcPptpBruter
homepage :
	 https://thc.org
url :
	 https://freeworld.thc.org/releases/thc-pptp-bruter-0.1.4.tar.gz
description :
	 Brute force program against PPTP VPN endpoints (TCP port 1723)
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/pptp_bruter.c", "pty.h", "util.h"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
