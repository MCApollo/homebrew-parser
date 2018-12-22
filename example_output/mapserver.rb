name :
	 Mapserver
homepage :
	 https://mapserver.org/
url :
	 https://download.osgeo.org/mapserver/mapserver-7.2.1.tar.gz
description :
	 Publish spatial data and interactive mapping apps to the web
build_deps :
	 cmake
	 pkg-config
	 swig
link_deps :
	 fcgi
	 freetype
	 gd
	 gdal
	 giflib
	 libpng
	 proj
	 protobuf-c
	 cairo
	 geos
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %w[
	 -DWITH_KML=ON
	 -DWITH_CURL=ON
	 -DWITH_CLIENT_WMS=ON
	 -DWITH_CLIENT_WFS=ON
	 -DWITH_SOS=ON
	 -DWITH_PROJ=ON
	 -DWITH_GDAL=ON
	 -DWITH_OGR=ON
	 -DWITH_WFS=ON
	 -DWITH_FRIBIDI=OFF
	 -DWITH_HARFBUZZ=OFF
	 -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python
	 ]
	 inreplace "mapscript/php/CMakeLists.txt", "${PHP5_EXTENSION_DIR}", lib/"php/extensions"
	 args << "-DWITH_PHP=ON" if build.with? "php"
	 inreplace "mapscript/python/CMakeLists.txt" do |s|
	 s.gsub! "${PYTHON_SITE_PACKAGES}", lib/"python2.7/site-packages"
	 s.gsub! "${PYTHON_LIBRARIES}", "-Wl,-undefined,dynamic_lookup"
	 end
	 args << "-DWITH_PYTHON=ON"
	 args << "-DCMAKE_SKIP_RPATH=ON"
	 if build.with? "geos"
	 args << "-DWITH_GEOS=ON"
	 else
	 args << "-DWITH_GEOS=OFF"
	 end
	 if build.with? "cairo"
	 args << "-WITH_CAIRO=ON"
	 else
	 args << "-DWITH_CAIRO=OFF"
	 end
	 if build.with? "postgresql"
	 args << "-DWITH_POSTGIS=ON"
	 else
	 args << "-DWITH_POSTGIS=OFF"
	 end
	 if build.with? "fastcgi"
	 args << "-DWITH_FCGI=ON"
	 else
	 args << "-DWITH_FCGI=OFF"
	 end
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
