name :
	 Gl2ps
homepage :
	 https://www.geuz.org/gl2ps/
url :
	 https://geuz.org/gl2ps/src/gl2ps-1.4.0.tgz
description :
	 OpenGL to PostScript printing library
build_deps :
	 cmake
link_deps :
	 libpng
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", "-DGLUT_glut_LIBRARY=/System/Library/Frameworks/GLUT.framework", *std_cmake_args
	 system "make", "install"
