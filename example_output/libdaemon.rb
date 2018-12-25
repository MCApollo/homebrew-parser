name :
	 Libdaemon
homepage :
	 http://0pointer.de/lennart/projects/libdaemon/
url :
	 http://0pointer.de/lennart/projects/libdaemon/libdaemon-0.14.tar.gz
description :
	 C library that eases writing UNIX daemons
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
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
