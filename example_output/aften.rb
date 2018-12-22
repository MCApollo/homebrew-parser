name :
	 Aften
homepage :
	 https://aften.sourceforge.io/
url :
	 https://downloads.sourceforge.net/aften/aften-0.0.8.tar.bz2
description :
	 Audio encoder which generates ATSC A/52 compressed audio streams
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "default" do
	 system "cmake", "-DSHARED=ON", "..", *std_cmake_args
	 system "make", "install"
	 end
