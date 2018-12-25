name :
	 Timewarrior
homepage :
	 https://taskwarrior.org/docs/timewarrior/
url :
	 https://taskwarrior.org/download/timew-1.1.1.tar.gz
description :
	 Command-line time tracking application
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
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
