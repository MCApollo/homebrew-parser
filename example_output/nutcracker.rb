name :
	 Nutcracker
homepage :
	 https://github.com/twitter/twemproxy
url :
	 https://github.com/twitter/twemproxy/archive/v0.4.1.tar.gz
description :
	 Proxy for memcached and redis
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "autoreconf", "-ivf"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install "conf", "notes", "scripts"
