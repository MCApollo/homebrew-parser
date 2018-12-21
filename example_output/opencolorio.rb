name :
	 Opencolorio
homepage :
	 http://opencolorio.org/
url :
	 https://github.com/imageworks/OpenColorIO/archive/v1.1.0.tar.gz
description :
	 Color management solution geared towards motion picture production
build_deps :
	 cmake
	 pkg-config
link_deps :
	 little-cms2
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DCMAKE_VERBOSE_MAKEFILE=OFF"
	 args << "-DOCIO_BUILD_PYGLUE=OFF" if build.without? "python@2"
	 mkdir "macbuild" do
	 system "cmake", *args, ".."
	 system "make"
	 system "make", "install"
