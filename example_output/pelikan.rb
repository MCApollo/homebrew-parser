name :
	 Pelikan
homepage :
	 https://twitter.github.io/pelikan
url :
	 https://github.com/twitter/pelikan/archive/0.1.2.tar.gz
description :
	 Production-ready cache services
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "_build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "install"
	 end
