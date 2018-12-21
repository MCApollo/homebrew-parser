name :
	 SstpClient
homepage :
	 https://sstp-client.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/sstp-client/sstp-client/sstp-client-1.0.12.tar.gz
description :
	 SSTP (Microsofts Remote Access Solution for PPP over SSL) client
build_deps :
	 pkg-config
link_deps :
	 libevent
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--disable-ppp-plugin",
	 "--prefix=#{prefix}",
	 "--with-runtime-dir=#{var}/run/sstpc"
	 system "make", "install"
	 (var/"run/sstpc").mkpath
