name :
	 Xmount
homepage :
	 https://www.pinguin.lu/xmount/
url :
	 https://code.pinguin.lu/diffusion/XMOUNT/xmount.git
description :
	 Convert between multiple input & output disk image types
build_deps :
	 cmake
	 pkg-config
link_deps :
	 afflib
	 libewf
	 openssl
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend_path "PKG_CONFIG_PATH", Formula["openssl"].opt_lib/"pkgconfig"
	 Dir.chdir "trunk" do
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
	 end
