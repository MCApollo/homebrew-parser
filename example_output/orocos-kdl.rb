name :
	 OrocosKdl
homepage :
	 http://www.orocos.org/kdl
url :
	 https://github.com/orocos/orocos_kinematics_dynamics/archive/v1.4.0.tar.gz
description :
	 Orocos Kinematics and Dynamics C++ library
build_deps :
	 cmake
link_deps :
	 eigen
conflicts :
patches :
EOF_patch :
install :
	 cd "orocos_kdl" do
	 system "cmake", ".", "-DEIGEN3_INCLUDE_DIR=#{Formula["eigen"].opt_include}/eigen3",
	 *std_cmake_args
	 system "make", "install"
