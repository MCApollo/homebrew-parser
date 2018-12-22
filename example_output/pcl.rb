name :
	 Pcl
homepage :
	 http://www.pointclouds.org/
url :
	 https://github.com/PointCloudLibrary/pcl/archive/pcl-1.9.1.tar.gz
description :
	 Library for 2D/3D image and point cloud processing
build_deps :
	 cmake
	 pkg-config
link_deps :
	 boost
	 cminpack
	 eigen
	 flann
	 glew
	 libusb
	 qhull
	 vtk
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %w[
	 -DBUILD_SHARED_LIBS:BOOL=ON
	 -DBUILD_apps=AUTO_OFF
	 -DBUILD_apps_3d_rec_framework=AUTO_OFF
	 -DBUILD_apps_cloud_composer=AUTO_OFF
	 -DBUILD_apps_in_hand_scanner=AUTO_OFF
	 -DBUILD_apps_optronic_viewer=AUTO_OFF
	 -DBUILD_apps_point_cloud_editor=AUTO_OFF
	 -DBUILD_examples:BOOL=ON
	 -DBUILD_global_tests:BOOL=OFF
	 -DBUILD_outofcore:BOOL=AUTO_OFF
	 -DBUILD_people:BOOL=AUTO_OFF
	 -DBUILD_simulation:BOOL=AUTO_OFF
	 -DWITH_CUDA:BOOL=OFF
	 -DWITH_DOCS:BOOL=OFF
	 -DWITH_QT:BOOL=FALSE
	 -DWITH_TUTORIALS:BOOL=OFF
	 ]
	 if build.head?
	 args << "-DBUILD_apps_modeler=AUTO_OFF"
	 else
	 args << "-DBUILD_apps_modeler:BOOL=OFF"
	 end
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make", "install"
	 prefix.install Dir["#{bin}/*.app"]
	 end
