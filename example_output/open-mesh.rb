name :
	 OpenMesh
homepage :
	 https://openmesh.org/
url :
	 https://www.openmesh.org/media/Releases/7.1/OpenMesh-7.1.tar.bz2
description :
	 Generic data structure to represent and manipulate polygonal meshes
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 mkdir "build" do
	 system "cmake", "..", "-DBUILD_APPS=OFF", *std_cmake_args
	 system "make", "install"
	 end
