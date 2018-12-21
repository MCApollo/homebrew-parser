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
	 qt
conflicts :
	 pdftohtml
	 pdf2image
	 xpdf
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
