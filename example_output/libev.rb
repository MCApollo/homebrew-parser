name :
	 Libev
homepage :
	 http://software.schmorp.de/pkg/libev.html
url :
	 http://dist.schmorp.de/libev/Attic/libev-4.24.tar.gz
description :
	 Asynchronous event library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
	 (include/"event.h").unlink
