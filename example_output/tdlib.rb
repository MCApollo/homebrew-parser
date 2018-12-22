name :
	 Tdlib
homepage :
	 https://core.telegram.org/tdlib
url :
	 https://github.com/tdlib/td/archive/v1.3.0.tar.gz
description :
	 Cross-platform library for building Telegram clients
build_deps :
	 cmake
link_deps :
	 gperf
	 openssl
	 readline
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 end
