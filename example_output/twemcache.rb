name :
	 Twemcache
homepage :
	 https://github.com/twitter/twemcache
url :
	 https://github.com/twitter/twemcache/archive/v2.6.3.tar.gz
description :
	 Twitter fork of memcached
build_deps :
	 autoconf
	 automake
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
	 system "autoreconf", "-fvi"
	 system "./configure", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
