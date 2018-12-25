name :
	 Jnettop
homepage :
	 https://web.archive.org/web/20161127214942/jnettop.kubs.info/wiki/
url :
	 https://downloads.sourceforge.net/project/jnettop/jnettop/0.13/jnettop-0.13.0.tar.gz
description :
	 View hosts/ports taking up the most network traffic
build_deps :
	 pkg-config
link_deps :
	 glib
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
	 "--man=#{man}"
	 system "make", "install"
