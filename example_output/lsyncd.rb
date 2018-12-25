name :
	 Lsyncd
homepage :
	 https://github.com/axkibe/lsyncd
url :
	 https://github.com/axkibe/lsyncd/archive/release-2.2.3.tar.gz
description :
	 Synchronize local directories with remote targets
build_deps :
	 cmake
link_deps :
	 lua
optional_deps :
conflicts :
resource :
	 ['xnu']
	 ['https://opensource.apple.com/tarballs/xnu/#{tarball}']
patches :
EOF_patch :
install :
	 inreplace "CMakeLists.txt", "DESTINATION man", "DESTINATION share/man/man1"
	 resource("xnu").stage buildpath/"xnu"
	 system "cmake", ".", "-DWITH_INOTIFY=OFF", "-DWITH_FSEVENTS=ON",
	 "-DXNU_DIR=#{buildpath}/xnu", *std_cmake_args
	 system "make", "install"
