name :
	 Monetdb
homepage :
	 https://www.monetdb.org/
url :
	 https://www.monetdb.org/downloads/sources/Aug2018-SP1/MonetDB-11.31.11.tar.xz
description :
	 Column-store database
build_deps :
	 libatomic_ops
	 pkg-config
link_deps :
	 openssl
	 pcre
	 readline
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["M4DIRS"] = "#{Formula["gettext"].opt_share}/aclocal" if build.head?
	 system "./bootstrap" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--enable-assert=no",
	 "--enable-debug=no",
	 "--enable-optimize=yes",
	 "--enable-testing=no",
	 "--with-readline=#{Formula["readline"].opt_prefix}",
	 "--disable-rintegration"
	 system "make", "install"
