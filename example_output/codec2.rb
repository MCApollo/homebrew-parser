name :
	 Codec2
homepage :
	 https://www.rowetel.com/?page_id=452
url :
	 https://hobbes1069.fedorapeople.org/freetel/codec2/codec2-0.8.1.tar.xz
description :
	 Open source speech codec
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
	 mkdir "build_osx" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
