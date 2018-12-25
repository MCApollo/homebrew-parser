name :
	 Draco
homepage :
	 https://google.github.io/draco/
url :
	 https://github.com/google/draco/archive/1.3.4.tar.gz
description :
	 3D geometric mesh and point cloud compression library
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", * std_cmake_args
	 system "make", "install"
	 end
	 pkgshare.install "testdata/cube_att.ply"
