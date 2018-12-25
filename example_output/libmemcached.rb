name :
	 Libmemcached
homepage :
	 https://libmemcached.org/
url :
	 https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz
description :
	 C and C++ client library to the memcached server
build_deps :
link_deps :
	 memcached
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/60f3532/libmemcached/1.0.18.patch
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
