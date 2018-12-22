name :
	 Osm2pgsql
homepage :
	 https://wiki.openstreetmap.org/wiki/Osm2pgsql
url :
	 https://github.com/openstreetmap/osm2pgsql/archive/0.96.0.tar.gz
description :
	 OpenStreetMap data to PostgreSQL converter
build_deps :
	 cmake
link_deps :
	 boost
	 geos
	 lua
	 postgresql
	 proj
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 lua_version = Formula["lua"].version.to_s.match(/\d\.\d/)
	 inreplace "cmake/FindLua.cmake", "LUA_VERSIONS5 5.3 5.2 5.1 5.0",
	 "LUA_VERSIONS5 #{lua_version}"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 end
