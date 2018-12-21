name :
	 Webfs
homepage :
	 https://linux.bytesex.org/misc/webfs.html
url :
	 https://www.kraxel.org/releases/webfs/webfs-1.21.tar.gz
description :
	 HTTP server for purely static content
build_deps :
link_deps :
	 openssl
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/0518a6d1/webfs/patch-ls.c
EOF_patch :
install :
	 ENV["prefix"]=prefix
	 system "make", "install", "mimefile=/etc/apache2/mime.types"
