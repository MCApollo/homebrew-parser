name :
	 Neomutt
homepage :
	 https://neomutt.org/
url :
	 https://github.com/neomutt/neomutt/archive/neomutt-20180716.tar.gz
description :
	 E-mail reader with support for Notmuch, NNTP and much more
build_deps :
	 docbook-xsl
link_deps :
	 gettext
	 gpgme
	 libidn
	 lmdb
	 notmuch
	 openssl
	 tokyo-cabinet
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-gpgme",
	 "--gss",
	 "--lmdb",
	 "--notmuch",
	 "--sasl",
	 "--tokyocabinet",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}",
	 "--with-ui=ncurses"
	 system "make", "install"
