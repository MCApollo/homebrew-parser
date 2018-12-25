name :
	 Darkhttpd
homepage :
	 https://unix4lyfe.org/darkhttpd/
url :
	 https://unix4lyfe.org/darkhttpd/darkhttpd-1.12.tar.bz2
description :
	 Small static webserver without CGI
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "darkhttpd"
