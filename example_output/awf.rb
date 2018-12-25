name :
	 Awf
homepage :
	 https://github.com/valr/awf
url :
	 https://github.com/valr/awf/archive/v1.4.0.tar.gz
description :
	 'A Widget Factory' is a theme preview application for gtk2 and gtk3
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 gtk+
	 gtk+3
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "src/awf.c", "/usr/share/themes", "#{HOMEBREW_PREFIX}/share/themes"
	 system "./autogen.sh"
	 rm "README.md"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
