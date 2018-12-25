name :
	 Alpine
homepage :
	 https://repo.or.cz/alpine.git
url :
	 https://ftp.osuosl.org/pub/blfs/conglomeration/alpine/alpine-2.21.tar.xz
description :
	 News and email agent
build_deps :
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 --disable-debug
	 --with-ssl-dir=#{Formula["openssl"].opt_prefix}
	 --with-ssl-certs-dir=#{etc}/openssl
	 --prefix=#{prefix}
	 --with-passfile=.pine-passfile
	 ]
	 system "./configure", *args
	 system "make", "install"
