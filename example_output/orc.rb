name :
	 Orc
homepage :
	 https://cgit.freedesktop.org/gstreamer/orc/
url :
	 https://gstreamer.freedesktop.org/src/orc/orc-0.4.28.tar.xz
description :
	 Oil Runtime Compiler (ORC)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-gtk-doc"
	 system "make", "install"
