name :
	 Dns2tcp
homepage :
	 https://packages.debian.org/sid/dns2tcp
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/d/dns2tcp/dns2tcp_0.5.2.orig.tar.gz
description :
	 TCP over DNS tunnel
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
