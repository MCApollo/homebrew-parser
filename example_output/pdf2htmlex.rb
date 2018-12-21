name :
	 Pdf2htmlex
homepage :
	 https://coolwanglu.github.io/pdf2htmlEX/
url :
	 https://github.com/coolwanglu/pdf2htmlEX/archive/v0.14.6.tar.gz
description :
	 PDF to HTML converter
build_deps :
	 autoconf
	 automake
	 cmake
	 pkg-config
link_deps :
	 cairo
	 freetype
	 gettext
	 giflib
	 glib
	 gnu-getopt
	 jpeg
	 libpng
	 libtiff
	 libtool
	 :macos
	 openjpeg
	 pango
	 ttfautohint
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11 if MacOS.version < :mavericks
	 resource("fontforge").stage do
	 inreplace "gutils/gimagereadgif.c", "DGifCloseFile(gif)", "DGifCloseFile(gif, NULL)"
	 ENV.append "LDFLAGS", "-lintl"
	 ENV["ARCHFLAGS"] = "-arch #{MacOS.preferred_arch}"
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{libexec}/fontforge",
	 "--without-libzmq",
	 "--without-x",
	 "--without-iconv",
	 "--disable-python-scripting",
	 "--disable-python-extension"
	 system "make"
	 system "make", "install"
