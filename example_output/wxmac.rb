name :
	 Wxmac
homepage :
	 https://www.wxwidgets.org
url :
	 https://github.com/wxWidgets/wxWidgets/releases/download/v3.0.4/wxWidgets-3.0.4.tar.bz2
description :
	 Cross-platform C++ GUI toolkit (wxWidgets for macOS)
build_deps :
link_deps :
	 jpeg
	 libpng
	 libtiff
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = [
	 "--prefix=#{prefix}",
	 "--enable-clipboard",
	 "--enable-controls",
	 "--enable-dataviewctrl",
	 "--enable-display",
	 "--enable-dnd",
	 "--enable-graphics_ctx",
	 "--enable-std_string",
	 "--enable-svg",
	 "--enable-unicode",
	 "--enable-webkit",
	 "--with-expat",
	 "--with-libjpeg",
	 "--with-libpng",
	 "--with-libtiff",
	 "--with-opengl",
	 "--with-osx_cocoa",
	 "--with-zlib",
	 "--disable-precomp-headers",
	 "--disable-monolithic",
	 "--with-macosx-version-min=#{MacOS.version}",
	 ]
	 args << "--enable-stl" if build.with? "stl"
	 args << (build.with?("static") ? "--disable-shared" : "--enable-shared")
	 system "./configure", *args
	 system "make", "install"
	 inreplace "#{bin}/wx-config", prefix, HOMEBREW_PREFIX
