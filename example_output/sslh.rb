name :
	 Sslh
homepage :
	 https://www.rutschle.net/tech/sslh.shtml
url :
	 https://www.rutschle.net/tech/sslh/sslh-v1.19c.tar.gz
description :
	 Forward connections based on first data packet sent by client
build_deps :
link_deps :
	 libconfig
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "install", "PREFIX=#{prefix}"
