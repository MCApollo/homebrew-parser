name :
	 Curaengine
homepage :
	 https://github.com/Ultimaker/CuraEngine
url :
	 https://github.com/Ultimaker/CuraEngine/archive/15.04.6.tar.gz
description :
	 C++ 3D printing GCode generator
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "VERSION=#{version}"
	 bin.install "build/CuraEngine"
