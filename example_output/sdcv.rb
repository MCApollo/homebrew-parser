name :
	 Sdcv
homepage :
	 https://dushistov.github.io/sdcv/
url :
	 https://github.com/Dushistov/sdcv/archive/v0.5.2.tar.gz
description :
	 StarDict Console Version
build_deps :
	 cmake
	 pkg-config
link_deps :
	 gettext
	 glib
	 readline
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "lang"
	 system "make", "install"
