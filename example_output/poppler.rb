name :
	 Poppler
homepage :
	 https://poppler.freedesktop.org/
url :
	 https://poppler.freedesktop.org/poppler-0.72.0.tar.xz
description :
	 PDF rendering library (based on the xpdf-3.0 code base)
build_deps :
	 cmake
	 gobject-introspection
	 pkg-config
link_deps :
	 cairo
	 fontconfig
	 freetype
	 gettext
	 glib
	 jpeg
	 libpng
	 libtiff
	 little-cms2
	 nss
	 openjpeg
optional_deps :
	 qt
conflicts :
	 pdftohtml
	 pdf2image
	 xpdf
resource :
	 ['font-data']
	 ['https://poppler.freedesktop.org/poppler-data-0.4.9.tar.gz']
patches :
EOF_patch :
install :
	 ENV.cxx11 if build.with?("qt") || MacOS.version < :mavericks
	 args = std_cmake_args + %w[
	 -DBUILD_GTK_TESTS=OFF
	 -DENABLE_CMS=lcms2
	 -DENABLE_GLIB=ON
	 -DENABLE_QT4=OFF
	 -DENABLE_XPDF_HEADERS=ON
	 -DWITH_GObjectIntrospection=ON
	 ]
	 if build.with? "qt"
	 args << "-DENABLE_QT5=ON"
	 else
	 args << "-DENABLE_QT5=OFF"
	 end
	 system "cmake", ".", *args
	 system "make", "install"
	 system "make", "clean"
	 system "cmake", ".", "-DBUILD_SHARED_LIBS=OFF", *args
	 system "make"
	 lib.install "libpoppler.a"
	 lib.install "cpp/libpoppler-cpp.a"
	 lib.install "glib/libpoppler-glib.a"
	 resource("font-data").stage do
	 system "make", "install", "prefix=#{prefix}"
	 end
	 libpoppler = (lib/"libpoppler.dylib").readlink
	 to_fix = ["#{lib}/libpoppler-cpp.dylib", "#{lib}/libpoppler-glib.dylib",
	 *Dir["#{bin}/*"]]
	 to_fix << "#{lib}/libpoppler-qt5.dylib" if build.with?("qt")
	 to_fix.each do |f|
	 macho = MachO.open(f)
	 macho.change_dylib("@rpath/#{libpoppler}", "#{lib}/#{libpoppler}")
	 macho.write!
	 end
	 inreplace share/"gir-1.0/Poppler-0.18.gir", "@rpath", lib.to_s
	 system "g-ir-compiler", "--output=#{lib}/girepository-1.0/Poppler-0.18.typelib", share/"gir-1.0/Poppler-0.18.gir"
