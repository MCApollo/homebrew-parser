name :
	 Glew
homepage :
	 https://glew.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/glew/glew/2.1.0/glew-2.1.0.tgz
description :
	 OpenGL Extension Wrangler Library
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "build" do
	 system "cmake", "./cmake", *std_cmake_args
	 system "make"
	 system "make", "install"
	 end
	 doc.install Dir["doc/*"]
