name :
	 Lcm
homepage :
	 https://lcm-proj.github.io/
url :
	 https://github.com/lcm-proj/lcm/releases/download/v1.4.0/lcm-1.4.0.zip
description :
	 Libraries and tools for message passing and data marshalling
build_deps :
	 cmake
	 pkg-config
link_deps :
	 glib
	 :java
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DCMAKE_CXX_FLAGS=-I/System/Library/Frameworks/Python.framework/Headers",
	 "-DLCM_ENABLE_TESTS=OFF",
	 *std_cmake_args
	 system "make"
	 system "make", "install"
	 end
