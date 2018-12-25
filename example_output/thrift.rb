name :
	 Thrift
homepage :
	 https://thrift.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=/thrift/0.11.0/thrift-0.11.0.tar.gz
description :
	 Framework for scalable cross-language services development
build_deps :
	 bison
	 ant
link_deps :
	 boost
	 openssl
	 :java
optional_deps :
	 libevent
	 python@2
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap.sh" unless build.stable?
	 exclusions = ["--without-ruby", "--disable-tests", "--without-php_extension"]
	 exclusions << "--without-python" if build.without? "python@2"
	 exclusions << "--without-haskell" if build.without? "haskell"
	 exclusions << "--without-java" if build.without? "java"
	 exclusions << "--without-perl" if build.without? "perl"
	 exclusions << "--without-php" if build.without? "php"
	 exclusions << "--without-erlang" if build.without? "erlang"
	 ENV.cxx11 if MacOS.version >= :mavericks && ENV.compiler == :clang
	 ENV["PY_PREFIX"] = prefix
	 ENV["PHP_PREFIX"] = prefix
	 ENV["JAVA_PREFIX"] = buildpath
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--libdir=#{lib}",
	 "--with-openssl=#{Formula["openssl"].opt_prefix}",
	 *exclusions
	 ENV.deparallelize
	 system "make"
	 system "make", "install"
	 (pkgshare/"java").install Dir["usr/local/lib/*.jar"] if build.with? "java"
