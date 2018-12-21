name :
	 Udptunnel
homepage :
	 https://web.archive.org/web/20161224191851/www.cs.columbia.edu/~lennox/udptunnel/
url :
	 https://web.archive.org/web/20161224191851/www.cs.columbia.edu/~lennox/udptunnel/udptunnel-1.1.tar.gz
description :
	 Tunnel UDP packets over a TCP connection
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 doc.install "udptunnel.html"
