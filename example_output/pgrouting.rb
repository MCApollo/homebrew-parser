name :
	 Pgrouting
homepage :
	 https://pgrouting.org/
url :
	 https://github.com/pgRouting/pgrouting/archive/v2.6.2.tar.gz
description :
	 Provides geospatial routing for PostGIS/PostgreSQL database
build_deps :
	 cmake
link_deps :
	 boost
	 cgal
	 gmp
	 postgis
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 mkdir "stage"
	 mkdir "build" do
	 system "cmake", "-DWITH_DD=ON", "..", *std_cmake_args
	 system "make"
	 system "make", "install", "DESTDIR=#{buildpath}/stage"
	 end
	 lib.install Dir["stage/**/lib/*"]
	 (share/"postgresql/extension").install Dir["stage/**/share/postgresql/extension/*"]
