name :
	 UcspiTcp
homepage :
	 https://cr.yp.to/ucspi-tcp.html
url :
	 https://cr.yp.to/ucspi-tcp/ucspi-tcp-0.88.tar.gz
description :
	 Tools for building TCP client-server applications
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/homebrew/patches/2b3e4da/ucspi-tcp/patch-0.88-ipv6.diff
EOF_patch :
install :
	 (buildpath/"conf-home").unlink
	 (buildpath/"conf-home").write prefix
	 system "make"
	 bin.mkpath
	 system "make", "setup"
	 system "make", "check"
	 share.install prefix/"man"
