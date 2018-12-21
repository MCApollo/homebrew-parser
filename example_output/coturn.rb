name :
	 Coturn
homepage :
	 https://github.com/coturn/coturn
url :
	 http://turnserver.open-sys.org/downloads/v4.5.0.7/turnserver-4.5.0.7.tar.gz
description :
	 Free open source implementation of TURN and STUN Server
build_deps :
link_deps :
	 libevent
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--mandir=#{man}",
	 "--prefix=#{prefix}"
	 system "make", "install"
