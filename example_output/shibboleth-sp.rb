name :
	 ShibbolethSp
homepage :
	 https://wiki.shibboleth.net/confluence/display/SHIB2
url :
	 https://shibboleth.net/downloads/service-provider/3.0.2/shibboleth-sp-3.0.2.tar.bz2
description :
	 Shibboleth 2 Service Provider daemon
build_deps :
	 apr
	 apr-util
	 pkg-config
link_deps :
	 boost
	 httpd
	 log4shib
	 :macos
	 opensaml
	 openssl
	 unixodbc
	 xerces-c
	 xml-security-c
	 xml-tooling-c
conflicts :
patches :
EOF_patch :
install :
	 ENV.O2
	 ENV.cxx11
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --localstatedir=#{var}
	 --sysconfdir=#{etc}
	 --with-xmltooling=#{Formula["xml-tooling-c"].opt_prefix}
	 --with-saml=#{Formula["opensaml"].opt_prefix}
	 --enable-apache-24
	 DYLD_LIBRARY_PATH=#{lib}
	 ]
	 if MacOS.version >= :high_sierra
	 args << "--with-apxs24=#{Formula["httpd"].opt_bin}/apxs"
	 end
	 system "./configure", *args
	 system "make", "install"
	 (var/"run/shibboleth/").mkpath
	 (var/"cache/shibboleth").mkpath
