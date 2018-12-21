name :
	 RofsFiltered
homepage :
	 https://github.com/gburca/rofs-filtered/
url :
	 https://github.com/gburca/rofs-filtered/archive/rel-1.7.tar.gz
description :
	 Filtered read-only filesystem for FUSE
build_deps :
	 cmake
link_deps :
	 :macos
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DCMAKE_INSTALL_SYSCONFDIR=#{etc}", *std_cmake_args
	 system "make", "install"
