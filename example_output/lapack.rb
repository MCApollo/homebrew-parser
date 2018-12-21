name :
	 Lapack
homepage :
	 https://www.netlib.org/lapack/
url :
	 https://www.netlib.org/lapack/lapack-3.8.0.tar.gz
description :
	 Linear Algebra PACKage
build_deps :
	 cmake
link_deps :
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("MACOSX_DEPLOYMENT_TARGET")
	 mkdir "build" do
	 system "cmake", "..",
	 "-DBUILD_SHARED_LIBS:BOOL=ON",
	 "-DLAPACKE:BOOL=ON",
	 *std_cmake_args
	 system "make", "install"
