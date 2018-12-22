name :
	 Haproxy
homepage :
	 https://www.haproxy.org/
url :
	 https://www.haproxy.org/download/1.8/src/haproxy-1.8.15.tar.gz
description :
	 Reliable, high performance TCP/HTTP load balancer
build_deps :
link_deps :
	 openssl
	 pcre
	 lua
conflicts :
patches :
EOF_patch :
install :
	 args = %w[
	 TARGET=generic
	 USE_KQUEUE=1
	 USE_POLL=1
	 USE_PCRE=1
	 USE_OPENSSL=1
	 USE_THREAD=1
	 USE_ZLIB=1
	 ADDLIB=-lcrypto
	 ]
	 if build.with?("lua")
	 lua = Formula["lua"]
	 args << "USE_LUA=1"
	 args << "LUA_LIB=#{lua.opt_lib}"
	 args << "LUA_INC=#{lua.opt_include}/lua"
	 args << "LUA_LD_FLAGS=-L#{lua.opt_lib}"
	 end
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}", "LDFLAGS=#{ENV.ldflags}", *args
	 man1.install "doc/haproxy.1"
	 bin.install "haproxy"
