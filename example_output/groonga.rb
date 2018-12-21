name :
	 Groonga
homepage :
	 http://groonga.org/
url :
	 https://packages.groonga.org/source/groonga/groonga-8.0.5.tar.gz
description :
	 Fulltext search engine and column store
build_deps :
	 pkg-config
link_deps :
	 msgpack
	 openssl
	 pcre
	 mecab
	 mecab-ipadic
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-zeromq
	 --enable-mruby
	 --with-ssl
	 --with-zlib
	 --without-libstemmer
	 ]
	 args << "--with-mecab" if build.with? "mecab"
	 if build.head?
	 args << "--with-ruby"
	 system "./autogen.sh"
