name :
	 Lgogdownloader
homepage :
	 https://sites.google.com/site/gogdownloader/
url :
	 https://sites.google.com/site/gogdownloader/lgogdownloader-3.3.tar.gz
description :
	 Unofficial downloader for GOG.com games
build_deps :
	 cmake
	 help2man
	 pkg-config
link_deps :
	 boost
	 htmlcxx
	 jsoncpp
	 liboauth
	 rhash
	 tinyxml2
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
