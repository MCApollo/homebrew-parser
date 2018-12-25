name :
	 Libebml
homepage :
	 https://www.matroska.org/
url :
	 https://dl.matroska.org/downloads/libebml/libebml-1.3.6.tar.xz
description :
	 Sort of a sbinary version of XML
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
	 system "cmake", "..", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
	 system "make", "install"
	 end
