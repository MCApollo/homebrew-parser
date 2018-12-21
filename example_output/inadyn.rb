name :
	 Inadyn
homepage :
	 http://troglobit.com/projects/inadyn/
url :
	 https://github.com/troglobit/inadyn/releases/download/v2.5/inadyn-2.5.tar.gz
description :
	 Dynamic DNS client with IPv4, IPv6, and SSL/TLS support
build_deps :
	 autoconf
	 automake
	 cmake
	 libtool
link_deps :
	 confuse
	 gnutls
	 pkg-config
conflicts :
patches :
	 https://github.com/troglobit/inadyn/commit/57bdcc0321b49ee68397c70140d9895655edb06f.diff?full_index=1
EOF_patch :
install :
	 mkdir_p buildpath/"inadyn/m4"
	 system "autoreconf", "-vif"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}"
	 system "make", "install"
