name :
	 Sslmate
homepage :
	 https://sslmate.com
url :
	 https://packages.sslmate.com/other/sslmate-1.7.0.tar.gz
description :
	 Buy SSL certs from the command-line
build_deps :
link_deps :
	 python
	 perl
	 curl
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version <= :snow_leopard
	 ENV.prepend_path "PATH", Formula["perl"].bin
