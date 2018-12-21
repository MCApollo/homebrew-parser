name :
	 Tinyxml
homepage :
	 http://www.grinninglizard.com/tinyxml/
url :
	 https://downloads.sourceforge.net/project/tinyxml/tinyxml/2.6.2/tinyxml_2_6_2.tar.gz
description :
	 XML parser
build_deps :
	 cmake
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/robotology/yarp/master/extern/tinyxml/patches/enforce-use-stl.patch
	 https://raw.githubusercontent.com/robotology/yarp/master/extern/tinyxml/patches/entity-encoding.patch
	 https://gist.githubusercontent.com/scpeters/6325123/raw/cfb079be67997cb19a1aee60449714a1dedefed5/tinyxml_CMakeLists.patch
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 (lib+"pkgconfig/tinyxml.pc").write pc_file
