name :
	 XmlToolingC
homepage :
	 https://wiki.shibboleth.net/confluence/display/OpenSAML/XMLTooling-C
url :
	 https://shibboleth.net/downloads/c++-opensaml/3.0.0/xmltooling-3.0.2.tar.bz2
description :
	 Provides a higher level interface to XML processing
build_deps :
	 pkg-config
link_deps :
	 boost
	 log4shib
	 openssl
	 xerces-c
	 xml-security-c
optional_deps :
conflicts :
resource :
	 ['curl']
	 ['https://curl.haxx.se/download/curl-7.62.0.tar.bz2']
patches :
EOF_patch :
install :
	 ENV.O2
	 ENV.cxx11
	 ENV.prepend_path "PKG_CONFIG_PATH", "#{Formula["openssl"].opt_lib}/pkgconfig"
	 resource("curl").stage do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{libexec}/curl",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}",
	 "--with-ca-bundle=#{etc}/openssl/cert.pem",
	 "--with-ca-path=#{etc}/openssl/certs",
	 "--without-libssh2",
	 "--without-libmetalink",
	 "--without-gssapi",
	 "--without-librtmp",
	 "--disable-ares"
	 system "make", "install"
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", libexec/"curl/lib/pkgconfig"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
