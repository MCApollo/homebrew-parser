name :
	 Dynamips
homepage :
	 https://github.com/GNS3/dynamips
url :
	 https://github.com/GNS3/dynamips/archive/v0.2.18.tar.gz
description :
	 Cisco 7200/3600/3725/3745/2600/1700 Router Emulator
build_deps :
	 cmake
link_deps :
	 libelf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.append "CFLAGS", "-I#{Formula["libelf"].include}/libelf"
	 arch = Hardware::CPU.is_64_bit? ? "amd64" : "x86"
	 ENV.deparallelize
	 system "cmake", ".", "-DANY_COMPILER=1", *std_cmake_args
	 system "make", "DYNAMIPS_CODE=stable",
	 "DYNAMIPS_ARCH=#{arch}",
	 "install"
