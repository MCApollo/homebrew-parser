name :
	 ChinadnsC
homepage :
	 https://github.com/shadowsocks/ChinaDNS
url :
	 https://github.com/shadowsocks/ChinaDNS/releases/download/1.3.2/chinadns-1.3.2.tar.gz
description :
	 Port of ChinaDNS to C: fix irregularities with DNS in China
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
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
