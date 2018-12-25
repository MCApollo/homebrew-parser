name :
	 Nylon
homepage :
	 https://github.com/smeinecke/nylon
url :
	 https://monkey.org/~marius/nylon/nylon-1.21.tar.gz
description :
	 Proxy server
build_deps :
link_deps :
	 libevent
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--with-libevent=#{HOMEBREW_PREFIX}"
	 system "make", "install"
