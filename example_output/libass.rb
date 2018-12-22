name :
	 Libass
homepage :
	 https://github.com/libass/libass
url :
	 https://github.com/libass/libass/releases/download/0.14.0/libass-0.14.0.tar.xz
description :
	 Subtitle renderer for the ASS/SSA subtitle format
build_deps :
	 nasm
	 pkg-config
link_deps :
	 freetype
	 fribidi
	 harfbuzz
	 fontconfig
conflicts :
patches :
EOF_patch :
install :
	 args = %W[--disable-dependency-tracking --prefix=#{prefix}]
	 args << "--disable-harfbuzz" if build.without? "harfbuzz"
	 if build.with? "fontconfig"
	 args << "--disable-coretext"
	 else
	 args << "--disable-fontconfig"
	 end
	 system "autoreconf", "-i" if build.head?
	 system "./configure", *args
	 system "make", "install"
