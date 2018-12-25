name :
	 Freerdp
homepage :
	 https://www.freerdp.com/
url :
	 https://github.com/FreeRDP/FreeRDP/archive/1.0.2.tar.gz
description :
	 X11 implementation of the Remote Desktop Protocol (RDP)
build_deps :
	 cmake
	 pkg-config
link_deps :
	 openssl
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/FreeRDP/FreeRDP/commit/1d3289.diff?full_index=1
	 https://github.com/FreeRDP/FreeRDP/commit/e32f9e.diff?full_index=1
	 https://gist.githubusercontent.com/bmiklautz/8832375/raw/ac77b61185d11aa69e5f6b5e88c0fa597c04d964/freerdp-1.0.2-osxversion-patch.diff
EOF_patch :
install :
	 cmake_args = std_cmake_args
	 cmake_args << "-DWITH_X11=ON" << "-DBUILD_SHARED_LIBS=ON" if build.head?
	 system "cmake", ".", *cmake_args
	 system "make", "install"
