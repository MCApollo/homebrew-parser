name :
	 Dbxml
homepage :
	 https://www.oracle.com/database/berkeley-db/xml.html
url :
	 https://download.oracle.com/berkeley-db/dbxml-6.1.4.tar.gz
description :
	 Embeddable XML database with XQuery support and other advanced features
build_deps :
link_deps :
	 berkeley-db
	 xerces-c
	 xqilla
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/master/dbxml/c%2B%2B11.patch
EOF_patch :
install :
	 ENV.cxx11
	 inreplace "dbxml/configure" do |s|
	 s.gsub! "lib/libdb-*.la | sed -e 's\/.*db-\\\(.*\\\).la", "lib/libdb-*.a | sed -e 's/.*db-\\(.*\\).a"
	 s.gsub! "lib/libdb-*.la", "lib/libdb-*.a"
	 s.gsub! "libz.a", "libz.dylib"
	 end
	 cd "dbxml" do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-xqilla=#{Formula["xqilla"].opt_prefix}",
	 "--with-xerces=#{Formula["xerces-c"].opt_prefix}",
	 "--with-berkeleydb=#{Formula["berkeley-db"].opt_prefix}"
	 system "make", "install"
	 end
