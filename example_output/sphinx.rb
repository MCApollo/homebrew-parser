name :
	 Sphinx
homepage :
	 https://sphinxsearch.com/
url :
	 https://sphinxsearch.com/files/sphinx-2.2.11-release.tar.gz
description :
	 Full-text search engine
build_deps :
link_deps :
	 mysql
	 openssl
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 resource("stemmer").stage do
	 system "make", "dist_libstemmer_c"
	 system "tar", "xzf", "dist/libstemmer_c.tgz", "-C", buildpath
	 end
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --localstatedir=#{var}
	 --with-libstemmer
	 ]
	 if build.with? "mysql"
	 args << "--with-mysql"
	 else
	 args << "--without-mysql"
	 end
	 if build.with? "postgresql"
	 args << "--with-pgsql"
	 else
	 args << "--without-pgsql"
	 end
	 system "./configure", *args
	 system "make", "install"
