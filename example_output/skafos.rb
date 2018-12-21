name :
	 Skafos
homepage :
	 https://metismachine.com/
url :
	 https://github.com/MetisMachine/skafos/archive/1.7.7.tar.gz
description :
	 CLI for the Metis Machine A.I. and machine learning deployment platform
build_deps :
	 cmake
link_deps :
	 libarchive
	 yaml-cpp
conflicts :
patches :
EOF_patch :
install :
	 system "make", "_create_version_h"
	 system "make", "_env_for_prod"
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
