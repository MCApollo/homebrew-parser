name :
	 Exiv2
homepage :
	 http://www.exiv2.org/
url :
	 http://www.exiv2.org/builds/exiv2-0.26-trunk.tar.gz
description :
	 EXIF and IPTC metadata manipulation library and tools
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 args = std_cmake_args
	 args += %W[
	 -DEXIV2_ENABLE_SHARED=ON
	 -DEXIV2_ENABLE_XMP=ON
	 -DEXIV2_ENABLE_LIBXMP=ON
	 -DEXIV2_ENABLE_VIDEO=ON
	 -DEXIV2_ENABLE_PNG=ON
	 -DEXIV2_ENABLE_NLS=ON
	 -DEXIV2_ENABLE_PRINTUCS2=ON
	 -DEXIV2_ENABLE_LENSDATA=ON
	 -DEXIV2_ENABLE_COMMERCIAL=OFF
	 -DEXIV2_ENABLE_BUILD_SAMPLES=ON
	 -DEXIV2_ENABLE_BUILD_PO=ON
	 -DEXIV2_ENABLE_VIDEO=ON
	 -DEXIV2_ENABLE_WEBREADY=ON
	 -DEXIV2_ENABLE_CURL=ON
	 -DEXIV2_ENABLE_SSH=ON
	 -DSSH_LIBRARY=#{Formula["libssh"].opt_lib}/libssh.dylib
	 -DSSH_INCLUDE_DIR=#{Formula["libssh"].opt_include}
	 ..
	 ]
	 mkdir "build.cmake" do
	 system "cmake", "-G", "Unix Makefiles", ".", *args
	 system "make", "install"
	 mv prefix/"man", man
	 end
	 else
	 system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
	 system "make", "install"
