name :
	 ArcadeLearningEnvironment
homepage :
	 https://github.com/mgbellemare/Arcade-Learning-Environment
url :
	 https://github.com/mgbellemare/Arcade-Learning-Environment/archive/v0.6.0.tar.gz
description :
	 Platform for AI research
build_deps :
	 cmake
link_deps :
	 numpy
	 python
	 sdl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 system "python3", *Language::Python.setup_install_args(prefix)
