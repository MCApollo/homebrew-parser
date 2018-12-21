name :
	 Makedepend
homepage :
	 https://x.org/
url :
	 https://xorg.freedesktop.org/releases/individual/util/makedepend-1.0.5.tar.bz2
description :
	 Creates dependencies in makefiles
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resource("xproto").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{buildpath}/xproto"
	 system "make", "install"
