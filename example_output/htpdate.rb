name :
	 Htpdate
homepage :
	 http://www.vervest.org/htp/
url :
	 http://www.vervest.org/htp/archive/c/htpdate-0.9.1.tar.bz2
description :
	 Synchronize time with remote web servers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "prefix=#{prefix}",
	 "STRIP=/usr/bin/strip",
	 "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "install"
