name :
	 Jasper
homepage :
	 https://www.ece.uvic.ca/~frodo/jasper/
url :
	 https://github.com/mdadams/jasper/archive/version-2.0.14.tar.gz
description :
	 Library for manipulating JPEG-2000 images
build_deps :
	 cmake
link_deps :
	 jpeg
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 glut_lib = "#{MacOS.sdk_path}/System/Library/Frameworks/GLUT.framework"
	 system "cmake", "..", "-DGLUT_glut_LIBRARY=#{glut_lib}", *std_cmake_args
	 system "make"
	 system "make", "test"
	 system "make", "install"
	 end
