name :
	 Mailutils
homepage :
	 https://mailutils.org/
url :
	 https://ftp.gnu.org/gnu/mailutils/mailutils-3.4.tar.gz
description :
	 Swiss Army knife of email handling
build_deps :
link_deps :
	 gnutls
	 gsasl
	 libtool
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-mh",
	 "--prefix=#{prefix}",
	 "--without-guile",
	 "--without-tokyocabinet"
	 system "make", "PYTHON_LIBS=-undefined dynamic_lookup", "install"
