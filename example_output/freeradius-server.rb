name :
	 FreeradiusServer
homepage :
	 https://freeradius.org/
url :
	 https://github.com/FreeRADIUS/freeradius-server/archive/release_3_0_17.tar.gz
description :
	 High-performance and highly configurable RADIUS server
build_deps :
link_deps :
	 openssl
	 talloc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 --prefix=#{prefix}
	 --sbindir=#{bin}
	 --localstatedir=#{var}
	 --with-openssl-includes=#{Formula["openssl"].opt_include}
	 --with-openssl-libraries=#{Formula["openssl"].opt_lib}
	 --with-talloc-lib-dir=#{Formula["talloc"].opt_lib}
	 --with-talloc-include-dir=#{Formula["talloc"].opt_include}
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 (var/"run/radiusd").mkpath
	 (var/"log/radius").mkpath
