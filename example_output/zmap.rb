name :
	 Zmap
homepage :
	 https://zmap.io
url :
	 https://github.com/zmap/zmap/archive/v2.1.1.tar.gz
description :
	 Network scanner for Internet-wide network studies
build_deps :
	 byacc
	 cmake
	 gengetopt
	 pkg-config
link_deps :
	 gmp
	 json-c
	 libdnet
	 hiredis
	 mongo-c-driver
conflicts :
patches :
EOF_patch :
install :
	 inreplace ["conf/zmap.conf", "src/zmap.c", "src/zopt.ggo.in"], "/etc", etc
	 args = std_cmake_args
	 args << "-DENABLE_DEVELOPMENT=OFF"
	 args << "-DRESPECT_INSTALL_PREFIX_CONFIG=ON"
	 args << "-DWITH_REDIS=ON" if build.with? "hiredis"
	 args << "-DWITH_MONGO=ON" if build.with? "mongo-c-driver"
	 system "cmake", ".", *args
	 system "make"
	 system "make", "install"
