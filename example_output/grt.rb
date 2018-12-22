name :
	 Grt
homepage :
	 https://nickgillian.com/grt/
url :
	 https://github.com/nickgillian/grt/archive/v0.0.1.tar.gz
description :
	 The Gesture Recognition Toolkit for real-time machine learning
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "build"
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
