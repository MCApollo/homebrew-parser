name :
	 Libssh
homepage :
	 https://www.libssh.org/
url :
	 https://www.libssh.org/files/0.8/libssh-0.8.4.tar.xz
description :
	 C library SSHv1/SSHv2 client and server protocols
build_deps :
	 cmake
link_deps :
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", "-DWITH_STATIC_LIB=ON",
	 "-DWITH_SYMBOL_VERSIONING=OFF",
	 *std_cmake_args
	 system "make", "install"
	 end
