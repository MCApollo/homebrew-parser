name :
	 ThriftAT09
homepage :
	 https://thrift.apache.org
url :
	 https://archive.apache.org/dist/thrift/0.9.3/thrift-0.9.3.tar.gz
description :
	 Framework for scalable cross-language services development
build_deps :
	 autoconf
	 automake
	 bison
	 libtool
	 pkg-config
	 ant
link_deps :
	 boost
	 openssl
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %w[
	 --without-erlang
	 --without-haskell
	 --without-perl
	 --without-php
	 --without-php_extension
	 --without-python
	 --without-ruby
	 --without-tests
	 ]
	 args << "--without-java" if build.without? "java"
	 ENV.cxx11 if MacOS.version >= :mavericks && ENV.compiler == :clang
	 ENV["JAVA_PREFIX"] = pkgshare/"java"
	 inreplace "configure", 'ANT=""', "ANT=\"#{Formula["ant"].opt_bin}/ant\""
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--libdir=#{lib}",
	 *args
	 ENV.deparallelize
	 system "make", "install"
