name :
	 Spiped
homepage :
	 https://www.tarsnap.com/spiped.html
url :
	 https://www.tarsnap.com/spiped/spiped-1.6.0.tgz
description :
	 Secure pipe daemon
build_deps :
	 bsdmake
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 man1.mkpath
	 system "bsdmake", "BINDIR_DEFAULT=#{bin}", "MAN1DIR=#{man1}", "install"
