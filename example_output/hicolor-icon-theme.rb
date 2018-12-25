name :
	 HicolorIconTheme
homepage :
	 https://wiki.freedesktop.org/www/Software/icon-theme/
url :
	 https://icon-theme.freedesktop.org/releases/hicolor-icon-theme-0.17.tar.xz
description :
	 Fallback theme for FreeDesktop.org icon themes
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
	 args = %W[--prefix=#{prefix} --disable-silent-rules]
	 if build.head?
	 system "./autogen.sh", *args
	 else
	 system "./configure", *args
	 end
	 system "make", "install"
