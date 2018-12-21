name :
	 Opensaml
homepage :
	 https://wiki.shibboleth.net/confluence/display/OpenSAML/Home
url :
	 https://shibboleth.net/downloads/c++-opensaml/3.0.0/opensaml-3.0.0.tar.bz2
description :
	 Library for Security Assertion Markup Language
build_deps :
	 pkg-config
link_deps :
	 log4shib
	 openssl
	 xerces-c
	 xml-security-c
	 xml-tooling-c
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
	 system "make", "install"
