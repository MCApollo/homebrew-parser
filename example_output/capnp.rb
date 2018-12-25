name :
	 Capnp
homepage :
	 https://capnproto.org/
url :
	 https://capnproto.org/capnproto-c++-0.7.0.tar.gz
description :
	 Data interchange format and capability-based RPC system
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
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
