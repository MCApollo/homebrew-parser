name :
	 Osm2pgrouting
homepage :
	 https://pgrouting.org/docs/tools/osm2pgrouting.html
url :
	 https://github.com/pgRouting/osm2pgrouting/archive/v2.3.6.tar.gz
description :
	 Import OSM data into pgRouting database
build_deps :
	 cmake
link_deps :
	 boost
	 expat
	 libpqxx
	 pgrouting
	 postgis
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
