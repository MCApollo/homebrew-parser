name :
	 Fontforge
homepage :
	 https://fontforge.github.io
url :
	 https://github.com/fontforge/fontforge/releases/download/20170731/fontforge-dist-20170731.tar.xz
description :
	 Command-line outline and bitmap font editor/converter
build_deps :
	 pkg-config
link_deps :
	 cairo
	 fontconfig
	 gettext
	 giflib
	 jpeg
	 libpng
	 libspiro
	 libtiff
	 libtool
	 libuninameslist
	 pango
	 python@2
conflicts :
patches :
	 https://github.com/fontforge/fontforge/commit/9f69bd0f9.patch?full_index=1
EOF_patch :
install :
	 ENV["PYTHON_CFLAGS"] = `python-config --cflags`.chomp
	 ENV["PYTHON_LIBS"] = `python-config --ldflags`.chomp
	 inreplace "fontforgeexe/startnoui.c", "#include \"fontforgevw.h\"", "#include \"fontforgevw.h\"\n#include \"encoding.h\""
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--without-x"
	 system "make", "install"
	 (pkgshare/"osx/FontForge.app").rmtree
	 cd "contrib/fonttools" do
	 system "make"
	 bin.install Dir["*"].select { |f| File.executable? f }
