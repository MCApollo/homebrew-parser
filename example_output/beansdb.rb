name :
	 Beansdb
homepage :
	 https://github.com/douban/beansdb
url :
	 https://github.com/douban/beansdb/archive/v0.7.1.4.tar.gz
description :
	 Yet another distributed key-value storage system
build_deps :
	 autoconf
	 automake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 (var/"db/beansdb").mkpath
	 (var/"log").mkpath
