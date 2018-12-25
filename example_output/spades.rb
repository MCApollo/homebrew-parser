name :
	 Spades
homepage :
	 http://cab.spbu.ru/software/spades/
url :
	 http://cab.spbu.ru/files/release3.13.0/SPAdes-3.13.0.tar.gz
description :
	 De novo genome sequence assembly
build_deps :
	 cmake
link_deps :
	 gcc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 mkdir "src/build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
