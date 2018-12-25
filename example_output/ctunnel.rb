name :
	 Ctunnel
homepage :
	 https://github.com/alienrobotarmy/ctunnel
url :
	 https://www.alienrobotarmy.com/ctunnel/0.7/ctunnel-0.7.tar.gz
description :
	 Cryptographic or plain tunnels for TCP/UDP connections
build_deps :
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
	 inreplace "Makefile.cfg", "TUNTAP=yes", "TUNTAP=no"
	 system "make"
	 bin.mkpath
	 system "make", "-B", "install", "PREFIX=#{prefix}"
