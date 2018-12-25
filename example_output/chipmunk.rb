name :
	 Chipmunk
homepage :
	 https://chipmunk-physics.net/
url :
	 https://chipmunk-physics.net/release/Chipmunk-7.x/Chipmunk-7.0.2.tgz
description :
	 2D rigid body physics library written in C
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
	 system "cmake", ".", "-DBUILD_DEMOS=OFF", *std_cmake_args
	 system "make", "install"
	 doc.install Dir["doc/*"]
