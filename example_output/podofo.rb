name :
	 Podofo
homepage :
	 https://podofo.sourceforge.io
url :
	 https://downloads.sourceforge.net/podofo/podofo-0.9.5.tar.gz
description :
	 Library to work with the PDF file format
build_deps :
	 cmake
link_deps :
	 fontconfig
	 freetype
	 jpeg
	 libpng
	 libtiff
	 openssl
	 libidn
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DCMAKE_DISABLE_FIND_PACKAGE_LIBIDN=ON" if build.without? "libidn"
	 args << "-DCMAKE_DISABLE_FIND_PACKAGE_CppUnit=ON"
	 args << "-DCMAKE_DISABLE_FIND_PACKAGE_LUA=ON"
	 args << "-DPODOFO_BUILD_SHARED:BOOL=ON"
	 args << "-DFREETYPE_INCLUDE_DIR_FT2BUILD=#{Formula["freetype"].opt_include}/freetype2"
	 args << "-DFREETYPE_INCLUDE_DIR_FTHEADER=#{Formula["freetype"].opt_include}/freetype2/config/"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
