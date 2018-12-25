name :
	 NuSmv
homepage :
	 http://nusmv.fbk.eu
url :
	 http://nusmv.fbk.eu/distrib/NuSMV-2.6.0.tar.gz
description :
	 Reimplementation and extension of SMV symbolic model checker
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
	 mkdir "NuSMV/build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
