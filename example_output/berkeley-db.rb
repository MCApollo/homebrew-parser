name :
	 BerkeleyDb
homepage :
	 https://www.oracle.com/technology/products/berkeley-db/index.html
url :
	 https://dl.bintray.com/homebrew/mirror/berkeley-db-18.1.25.tar.gz
description :
	 High performance key/value database
build_deps :
link_deps :
	 :java
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --enable-cxx
	 --enable-compat185
	 --enable-sql
	 --enable-sql_codegen
	 --enable-dbm
	 --enable-stl
	 ]
	 args << "--enable-java" if build.with? "java"
	 cd "build_unix" do
	 system "../dist/configure", *args
	 system "make", "install"
	 doc.parent.mkpath
	 mv prefix/"docs", doc
