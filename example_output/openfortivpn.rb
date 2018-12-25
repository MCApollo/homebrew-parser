name :
	 Openfortivpn
homepage :
	 https://github.com/adrienverge/openfortivpn
url :
	 https://github.com/adrienverge/openfortivpn/archive/v1.8.1.tar.gz
description :
	 Open Fortinet client for PPP+SSL VPN tunnel services
build_deps :
	 autoconf
	 automake
	 pkg-config
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
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
