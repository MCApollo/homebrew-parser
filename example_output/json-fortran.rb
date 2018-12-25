name :
	 JsonFortran
homepage :
	 https://github.com/jacobwilliams/json-fortran
url :
	 https://github.com/jacobwilliams/json-fortran/archive/6.10.0.tar.gz
description :
	 Fortran 2008 JSON API
build_deps :
	 cmake
	 ford
link_deps :
	 gcc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args,
	 "-DUSE_GNU_INSTALL_CONVENTION:BOOL=TRUE",
	 "-DENABLE_UNICODE:BOOL=TRUE"
	 system "make", "install"
	 end
