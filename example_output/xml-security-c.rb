name :
	 XmlSecurityC
homepage :
	 https://santuario.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=/santuario/c-library/xml-security-c-2.0.2.tar.bz2
description :
	 Implementation of primary security standards for XML
build_deps :
	 pkg-config
link_deps :
	 openssl
	 xerces-c
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}"
	 system "make", "install"
