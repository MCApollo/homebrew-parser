name :
	 Libusrsctp
homepage :
	 https://github.com/sctplab/usrsctp
url :
	 https://github.com/sctplab/usrsctp/archive/0.9.3.0.tar.gz
description :
	 Portable SCTP userland stack
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 system "make", "install"
