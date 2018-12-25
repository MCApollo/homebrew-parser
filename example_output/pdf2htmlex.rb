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
optional_deps :
conflicts :
resource :
	 ['fontforge', 'poppler', 'poppler-data']
	 ['pdf2htmlEX', 'https://poppler.freedesktop.org/poppler-0.57.0.tar.xz', 'https://poppler.freedesktop.org/poppler-data-0.4.8.tar.gz']
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
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", "#{libexec}/fontforge/lib/pkgconfig"
	 ENV.prepend_path "PATH", "#{libexec}/fontforge/bin"
	 resource("poppler").stage do
	 inreplace "poppler.pc.in", "Cflags: -I${includedir}/poppler",
	 "Cflags: -I${includedir}/poppler -I${includedir}"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{libexec}/poppler",
	 "--enable-xpdf-headers",
	 "--enable-poppler-glib",
	 "--disable-gtk-test",
	 "--enable-introspection=no",
	 "--disable-poppler-qt4"
	 system "make", "install"
	 resource("poppler-data").stage do
	 system "make", "install", "prefix=#{libexec}/poppler"
	 end
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", "#{libexec}/poppler/lib/pkgconfig"
	 ENV.prepend_path "PATH", "#{libexec}/poppler/bin"
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 system "make", "install"
