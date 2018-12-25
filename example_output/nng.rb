name :
	 Nng
homepage :
	 https://nanomsg.github.io/nng/
url :
	 https://github.com/nanomsg/nng/archive/v1.1.1.tar.gz
description :
	 Nanomsg-next-generation -- light-weight brokerless messaging
build_deps :
	 asciidoctor
	 cmake
	 ninja
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
	 system "cmake", "..", "-GNinja", "-DNNG_ENABLE_DOC=ON", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "ninja"
	 system "ninja", "install"
	 end
