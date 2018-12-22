name :
	 Dartsim
homepage :
	 https://dartsim.github.io/
url :
	 https://github.com/dartsim/dart/archive/v6.6.2.tar.gz
description :
	 Dynamic Animation and Robotics Toolkit
build_deps :
	 cmake
	 pkg-config
link_deps :
	 assimp
	 boost
	 bullet
	 eigen
	 fcl
	 flann
	 libccd
	 nlopt
	 ode
	 open-scene-graph
	 tinyxml2
	 urdfdom
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", "-DGLUT_glut_LIBRARY=/System/Library/Frameworks/GLUT.framework",
	 *std_cmake_args
	 system "make", "install"
	 inreplace share/"dart/cmake/dart_dartTargets.cmake" do |s|
	 s.gsub! Formula["fcl"].prefix.realpath, Formula["fcl"].opt_prefix
	 s.gsub! Formula["libccd"].prefix.realpath, Formula["libccd"].opt_prefix
	 end
	 inreplace share/"dart/cmake/dart_utils-urdfTargets.cmake" do |s|
	 s.gsub! Formula["urdfdom"].prefix.realpath, Formula["urdfdom"].opt_prefix
	 s.gsub! Formula["urdfdom_headers"].prefix.realpath, Formula["urdfdom_headers"].opt_prefix
	 end
