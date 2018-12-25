name :
	 Veraxx
homepage :
	 https://bitbucket.org/verateam/vera
url :
	 https://bitbucket.org/verateam/vera/downloads/vera++-1.3.0.tar.gz
description :
	 Programmable tool for C++ source code
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 ['doc', 'boost', 'lua', 'luabind']
	 ['https://bitbucket.org/verateam/vera/downloads/vera++-1.3.0-doc.tar.gz', 'https://downloads.sourceforge.net/project/boost/boost/1.56.0/boost_1_56_0.tar.bz2', 'https://github.com/LuaDist/lua/archive/5.2.3.tar.gz', 'https://github.com/verateam/luabind/archive/vera-1.3.0.tar.gz']
patches :
EOF_patch :
install :
	 resource("boost").stage do
	 system "./bootstrap.sh", "--prefix=#{buildpath}/3rdParty",
	 "--with-libraries=filesystem,system,program_options,regex,wave,python"
	 system "./b2", "install", "threading=multi", "link=static", "warnings=off",
	 "cxxflags=-DBOOST_WAVE_SUPPORT_MS_EXTENSIONS=1", "-s NO_BZIP2=1"
	 end
	 resource("lua").stage do
	 args = std_cmake_args
	 args << "-DBUILD_SHARED_LIBS:BOOL=OFF"
	 args << "-DCMAKE_INSTALL_PREFIX:PATH=#{buildpath}/3rdParty"
	 system "cmake", ".", *args
	 system "make", "install"
	 end
	 resource("luabind").stage do
	 args = std_cmake_args
	 args << "-DBUILD_TESTING:BOOL=OFF"
	 args << "-DLUA_INCLUDE_DIR:PATH=#{buildpath}/3rdParty/include"
	 args << "-DLUA_LIBRARIES:PATH=#{buildpath}/3rdParty/lib/liblua.a"
	 args << "-DBOOST_ROOT:PATH=#{buildpath}/3rdParty"
	 args << "-DCMAKE_INSTALL_PREFIX:PATH=#{buildpath}/3rdParty"
	 system "cmake", ".", *args
	 system "make", "install"
	 end
	 system "cmake", ".",
	 "-DVERA_USE_SYSTEM_BOOST:BOOL=ON", "-DBoost_USE_STATIC_LIBS:BOOL=ON",
	 "-DLUA_INCLUDE_DIR:PATH=#{buildpath}/3rdParty/include",
	 "-DLUA_LIBRARIES:PATH=#{buildpath}/3rdParty/lib/liblua.a",
	 "-DLUA_LIBRARY:PATH=#{buildpath}/3rdParty/lib/liblua.a",
	 "-DLUABIND_INCLUDE_DIR:PATH=#{buildpath}/3rdParty/include",
	 "-DLUABIND_LIBRARIES:PATH=#{buildpath}/3rdParty/lib/libluabind.a",
	 "-DLUABIND_LIBRARY:PATH=#{buildpath}/3rdParty/lib/libluabind.a",
	 "-DBoost_INCLUDE_DIR:PATH=#{buildpath}/3rdParty/include",
	 "-DBoost_LIBRARY_DIR_RELEASE:PATH=#{buildpath}/3rdParty/lib",
	 *std_cmake_args
	 system "make", "install"
	 system "ctest"
	 resource("doc").stage do
	 man1.install "vera++.1"
	 doc.install "vera++.html"
	 end
