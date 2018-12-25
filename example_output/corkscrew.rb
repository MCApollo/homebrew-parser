name :
	 Corkscrew
homepage :
	 https://packages.debian.org/sid/corkscrew
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/c/corkscrew/corkscrew_2.0.orig.tar.gz
description :
	 Tunnel SSH through HTTP proxies
build_deps :
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
	 cp Dir["#{Formula["libtool"].opt_share}/libtool/*/config.{guess,sub}"], buildpath
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
