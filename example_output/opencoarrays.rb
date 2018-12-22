name :
	 Opencoarrays
homepage :
	 http://opencoarrays.org
url :
	 https://github.com/sourceryinstitute/OpenCoarrays/releases/download/2.3.1/OpenCoarrays-2.3.1.tar.gz
description :
	 Open-source coarray Fortran ABI, API, and compiler wrapper
build_deps :
	 cmake
link_deps :
	 gcc
	 open-mpi
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "install"
	 end
