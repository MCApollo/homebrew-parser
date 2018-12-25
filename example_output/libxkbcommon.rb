name :
	 Libxkbcommon
homepage :
	 https://xkbcommon.org/
url :
	 https://xkbcommon.org/download/libxkbcommon-0.8.2.tar.xz
description :
	 Keyboard handling library
build_deps :
	 bison
	 pkg-config
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
