name :
	 Unshield
homepage :
	 https://github.com/twogood/unshield
url :
	 https://github.com/twogood/unshield/archive/1.4.3.tar.gz
description :
	 Extract files from InstallShield cabinet files
build_deps :
	 cmake
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
