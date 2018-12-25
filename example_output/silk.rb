name :
	 Silk
homepage :
	 https://tools.netsa.cert.org/silk/
url :
	 https://tools.netsa.cert.org/releases/silk-3.17.2.tar.gz
description :
	 Collection of traffic analysis tools
build_deps :
	 pkg-config
link_deps :
	 glib
	 libfixbuf
	 yaf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --mandir=#{man}
	 --enable-ipv6
	 --enable-data-rootdir=#{var}/silk
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 (var/"silk").mkpath
