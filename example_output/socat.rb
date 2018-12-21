name :
	 Socat
homepage :
	 http://www.dest-unreach.org/socat/
url :
	 http://www.dest-unreach.org/socat/download/socat-1.7.3.2.tar.gz
description :
	 netcat on steroids
build_deps :
link_deps :
	 openssl
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
