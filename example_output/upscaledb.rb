name :
	 Upscaledb
homepage :
	 https://upscaledb.com/
url :
	 http://files.upscaledb.com/dl/upscaledb-2.2.0.tar.gz
description :
	 Database for embedded devices
build_deps :
link_deps :
	 boost
	 gnutls
	 :java
	 openssl
	 protobuf
conflicts :
patches :
	 https://github.com/cruppstahl/upscaledb/commit/01156f9a8.patch?full_index=1
EOF_patch :
install :
	 inreplace "./src/5upscaledb/upscaledb.cc",
	 "
	 "
	 system "./bootstrap.sh" if build.head?
	 resource("libuv").stage do
	 system "make", "libuv.dylib", "SO_LDFLAGS=-Wl,-install_name,#{libexec}/libuv/lib/libuv.dylib"
	 (libexec/"libuv/lib").install "libuv.dylib"
	 (libexec/"libuv").install "include"
	 end
	 ENV.prepend "LDFLAGS", "-L#{libexec}/libuv/lib"
	 ENV.prepend "CFLAGS", "-I#{libexec}/libuv/include"
	 ENV.prepend "CPPFLAGS", "-I#{libexec}/libuv/include"
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "JDK=#{ENV["JAVA_HOME"]}"
	 system "make", "install"
	 pkgshare.install "samples"
