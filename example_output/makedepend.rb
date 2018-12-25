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
optional_deps :
conflicts :
resource :
	 ['xproto', 'xorg-macros']
	 ['https://xorg.freedesktop.org/releases/individual/proto/xproto-7.0.28.tar.gz', 'https://xorg.freedesktop.org/releases/individual/util/util-macros-1.19.0.tar.bz2']
patches :
EOF_patch :
install :
	 resource("xproto").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{buildpath}/xproto"
	 system "make", "install"
	 end
	 resource("xorg-macros").stage do
	 system "./configure", "--prefix=#{buildpath}/xorg-macros"
	 system "make", "install"
	 end
	 ENV.append_path "PKG_CONFIG_PATH", "#{buildpath}/xproto/lib/pkgconfig"
	 ENV.append_path "PKG_CONFIG_PATH", "#{buildpath}/xorg-macros/share/pkgconfig"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
