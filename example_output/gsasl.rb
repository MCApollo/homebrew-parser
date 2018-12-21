name :
	 Gsasl
homepage :
	 https://www.gnu.org/software/gsasl/
url :
	 https://ftp.gnu.org/gnu/gsasl/gsasl-1.8.0.tar.gz
description :
	 SASL library command-line interface
build_deps :
link_deps :
	 libntlm
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--with-gssapi-impl=mit",
	 "--prefix=#{prefix}"
	 system "make", "install"
