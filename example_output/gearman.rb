name :
	 Gearman
homepage :
	 http://gearman.org/
url :
	 https://github.com/gearman/gearmand/releases/download/1.1.18/gearmand-1.1.18.tar.gz
description :
	 Application framework to farm out work to other machines or processes
build_deps :
	 pkg-config
	 sphinx-doc
link_deps :
	 boost
	 libevent
	 hiredis
	 libmemcached
	 mysql
	 openssl
	 postgresql
	 libpqxx
	 tokyo-cabinet
	 wolfssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT") if DevelopmentTools.clang_build_version >= 900
	 Dir["tests/**/*.cc", "libtest/main.cc"].each do |test_file|
	 next unless /std::unique_ptr/ =~ File.read(test_file)
	 inreplace test_file, "std::unique_ptr", "std::auto_ptr"
	 end
	 args = [
	 "--prefix=#{prefix}",
	 "--localstatedir=#{var}",
	 "--disable-silent-rules",
	 "--disable-dependency-tracking",
	 "--disable-libdrizzle",
	 "--with-boost=#{Formula["boost"].opt_prefix}",
	 "--with-sqlite3",
	 ]
	 if build.with? "cyassl"
	 args << "--enable-ssl" << "--enable-cyassl"
	 elsif build.with? "openssl"
	 args << "--enable-ssl" << "--with-openssl=#{Formula["openssl"].opt_prefix}" << "--disable-cyassl"
	 else
	 args << "--disable-ssl" << "--disable-cyassl"
