name :
	 Fastd
homepage :
	 https://projects.universe-factory.net/projects/fastd
url :
description :
	 Fast and Secure Tunnelling Daemon
build_deps :
	 bison
	 cmake
	 pkg-config
link_deps :
	 json-c
	 libsodium
	 libuecc
	 openssl
	 :tuntap
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DENABLE_LTO=ON"
	 args << "-DENABLE_OPENSSL=ON" if build.with? "openssl"
	 args << "-DWITH_CIPHER_AES128_CTR_NACL=OFF"
	 mkdir "fastd-build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
