name :
	 Squid
homepage :
	 http://www.squid-cache.org/
url :
	 http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.28.tar.xz
description :
	 Advanced proxy caching server for HTTP, HTTPS, FTP, and Gopher
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
	 ENV.append "LDFLAGS", "-lresolv"
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --localstatedir=#{var}
	 --sysconfdir=#{etc}
	 --enable-ssl
	 --enable-ssl-crtd
	 --disable-eui
	 --enable-pf-transparent
	 --with-included-ltdl
	 --with-openssl
	 --enable-delay-pools
	 --enable-disk-io=yes
	 --enable-removal-policies=yes
	 --enable-storeio=yes
	 ]
	 system "./bootstrap.sh" if build.head?
	 system "./configure", *args
	 system "make", "install"
