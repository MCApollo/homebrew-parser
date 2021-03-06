name :
	 Dspdfviewer
homepage :
	 https://dspdfviewer.danny-edel.de/
url :
	 https://github.com/dannyedel/dspdfviewer/archive/v1.15.1.tar.gz
description :
	 Dual-Screen PDF Viewer for latex-beamer
build_deps :
	 cmake
	 gobject-introspection
	 pkg-config
link_deps :
	 boost
	 cairo
	 fontconfig
	 freetype
	 gettext
	 glib
	 jpeg
	 libpng
	 libtiff
	 openjpeg
	 qt
optional_deps :
conflicts :
resource :
	 ['poppler', 'font-data']
	 ['https://poppler.freedesktop.org/poppler-0.65.0.tar.xz', 'https://poppler.freedesktop.org/poppler-data-0.4.9.tar.gz']
patches :
EOF_patch :
install :
	 ENV.cxx11
	 resource("poppler").stage do
	 system "cmake", ".", *std_cmake_args,
	 "-DCMAKE_INSTALL_PREFIX=#{libexec}",
	 "-DBUILD_GTK_TESTS=OFF",
	 "-DENABLE_CMS=none",
	 "-DENABLE_GLIB=ON",
	 "-DENABLE_QT5=ON",
	 "-DWITH_GObjectIntrospection=ON",
	 "-DENABLE_XPDF_HEADERS=ON"
	 system "make", "install"
	 libpoppler = (libexec/"lib/libpoppler.dylib").readlink
	 to_fix = ["#{libexec}/lib/libpoppler-cpp.dylib", "#{libexec}/lib/libpoppler-glib.dylib",
	 "#{libexec}/lib/libpoppler-qt5.dylib", *Dir["#{libexec}/bin/*"]]
	 to_fix.each do |f|
	 macho = MachO.open(f)
	 macho.change_dylib("@rpath/#{libpoppler}", "#{libexec}/lib/#{libpoppler}")
	 macho.write!
	 end
	 resource("font-data").stage do
	 system "make", "install", "prefix=#{libexec}"
	 end
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", "#{libexec}/lib/pkgconfig"
	 ENV.prepend "LDFLAGS", "-L#{libexec}/lib"
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args,
	 "-DRunDualScreenTests=OFF",
	 "-DUsePrerenderedPDF=ON",
	 "-DUseQtFive=ON"
	 system "make", "install"
	 end
	 libpoppler = (libexec/"lib/libpoppler-qt5.dylib").readlink
	 macho = MachO.open(bin/"dspdfviewer")
	 macho.change_dylib("@rpath/#{libpoppler}", "#{libexec}/lib/#{libpoppler}")
	 macho.write!
