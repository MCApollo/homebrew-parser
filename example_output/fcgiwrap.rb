name :
	 Fcgiwrap
homepage :
	 https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/
url :
	 https://github.com/gnosek/fcgiwrap/archive/1.1.0.tar.gz
description :
	 CGI support for Nginx
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 fcgi
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-i"
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
