name :
	 Nmh
homepage :
	 https://www.nongnu.org/nmh/
url :
	 https://download.savannah.gnu.org/releases/nmh/nmh-1.7.1.tar.gz
description :
	 The new version of the MH mail handler
build_deps :
link_deps :
	 openssl
	 w3m
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}", "--libdir=#{libexec}",
	 "--with-cyrus-sasl",
	 "--with-tls"
	 system "make", "install"
