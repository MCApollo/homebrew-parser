name :
	 HttpLoad
homepage :
	 https://www.acme.com/software/http_load/
url :
	 https://www.acme.com/software/http_load/http_load-09Mar2016.tar.gz
description :
	 Test throughput of a web server by running parallel fetches
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 bin.mkpath
	 man1.mkpath
	 args = %W[
	 BINDIR=#{bin}
	 LIBDIR=#{lib}
	 MANDIR=#{man1}
	 CC=#{ENV.cc}
	 SSL_TREE=#{Formula["openssl"].opt_prefix}
	 ]
	 inreplace "Makefile", "#SSL_", "SSL_"
	 system "make", "install", *args
