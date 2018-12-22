name :
	 Sqlite
homepage :
	 https://sqlite.org/
url :
	 https://sqlite.org/2018/sqlite-autoconf-3260000.tar.gz
description :
	 Command-line interface for SQLite
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-DSQLITE_ENABLE_COLUMN_METADATA=1"
	 ENV.append "CPPFLAGS", "-DSQLITE_MAX_VARIABLE_NUMBER=250000"
	 ENV.append "CPPFLAGS", "-DSQLITE_ENABLE_RTREE=1"
	 ENV.append "CPPFLAGS", "-DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_FTS3_PARENTHESIS=1" if build.with? "fts"
	 ENV.append "CPPFLAGS", "-DSQLITE_ENABLE_FTS5=1" if build.with? "fts5"
	 ENV.append "CPPFLAGS", "-DSQLITE_ENABLE_JSON1=1" if build.with? "json1"
	 args = %W[
	 --prefix=#{prefix}
	 --disable-dependency-tracking
	 --enable-dynamic-extensions
	 --enable-readline
	 --disable-editline
	 ]
	 system "./configure", *args
	 system "make", "install"
	 if build.with? "functions"
	 buildpath.install resource("functions")
	 system ENV.cc, "-fno-common",
	 "-dynamiclib",
	 "extension-functions.c",
	 "-o", "libsqlitefunctions.dylib",
	 *ENV.cflags.to_s.split
	 lib.install "libsqlitefunctions.dylib"
	 end
