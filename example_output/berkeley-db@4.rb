name :
	 BerkeleyDbAT4
homepage :
	 https://www.oracle.com/technology/products/berkeley-db/index.html
url :
	 https://download.oracle.com/berkeley-db/db-4.8.30.tar.gz
description :
	 High performance key/value database
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/4c55b1/berkeley-db%404/clang.diff
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --enable-cxx
	 ]
	 cd "build_unix" do
	 system "../dist/configure", *args
	 system "make", "install"
	 doc.parent.mkpath
	 mv prefix+"docs", doc
