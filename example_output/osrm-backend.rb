name :
	 OsrmBackend
homepage :
	 http://project-osrm.org/
url :
	 https://github.com/Project-OSRM/osrm-backend/archive/v5.20.0.tar.gz
description :
	 High performance routing engine
build_deps :
	 cmake
link_deps :
	 boost
	 libstxxl
	 libxml2
	 libzip
	 lua
	 :macos
	 tbb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DENABLE_CCACHE:BOOL=OFF", *std_cmake_args
	 system "make"
	 system "make", "install"
	 end
	 pkgshare.install "profiles"
