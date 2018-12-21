name :
	 Mapnik
homepage :
	 https://mapnik.org/
url :
	 https://github.com/mapnik/mapnik/releases/download/v3.0.21/mapnik-v3.0.21.tar.bz2
description :
	 Toolkit for developing mapping applications
build_deps :
	 pkg-config
link_deps :
	 boost
	 cairo
	 freetype
	 gdal
	 harfbuzz
	 icu4c
	 jpeg
	 libpng
	 libtiff
	 postgresql
	 proj
	 webp
conflicts :
patches :
	 https://github.com/mapnik/mapnik/commit/c067eb7eec32fdd6d1c3d0e90b13a889459f2756.diff?full_index=1
EOF_patch :
install :
	 ENV.cxx11
	 ENV.delete("SDKROOT") if DevelopmentTools.clang_build_version >= 900
	 boost = Formula["boost"].opt_prefix
	 freetype = Formula["freetype"].opt_prefix
	 harfbuzz = Formula["harfbuzz"].opt_prefix
	 icu = Formula["icu4c"].opt_prefix
	 jpeg = Formula["jpeg"].opt_prefix
	 libpng = Formula["libpng"].opt_prefix
	 libtiff = Formula["libtiff"].opt_prefix
	 proj = Formula["proj"].opt_prefix
	 webp = Formula["webp"].opt_prefix
	 args = %W[
	 CC=#{ENV.cc}
	 CXX=#{ENV.cxx}
	 PREFIX=#{prefix}
	 BOOST_INCLUDES=#{boost}/include
	 BOOST_LIBS=#{boost}/lib
	 CAIRO=True
	 CPP_TESTS=False
	 FREETYPE_CONFIG=#{freetype}/bin/freetype-config
	 GDAL_CONFIG=#{Formula["gdal"].opt_bin}/gdal-config
	 HB_INCLUDES=#{harfbuzz}/include
	 HB_LIBS=#{harfbuzz}/lib
	 ICU_INCLUDES=#{icu}/include
	 ICU_LIBS=#{icu}/lib
	 INPUT_PLUGINS=all
	 JPEG_INCLUDES=#{jpeg}/include
	 JPEG_LIBS=#{jpeg}/lib
	 NIK2IMG=False
	 PG_CONFIG=#{Formula["postgresql"].opt_bin}/pg_config
	 PNG_INCLUDES=#{libpng}/include
	 PNG_LIBS=#{libpng}/lib
	 PROJ_INCLUDES=#{proj}/include
	 PROJ_LIBS=#{proj}/lib
	 TIFF_INCLUDES=#{libtiff}/include
	 TIFF_LIBS=#{libtiff}/lib
	 WEBP_INCLUDES=#{webp}/include
	 WEBP_LIBS=#{webp}/lib
	 ]
	 system "./configure", *args
	 system "make"
	 system "make", "install"
