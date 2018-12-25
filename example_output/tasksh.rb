name :
	 Tasksh
homepage :
	 https://tasktools.org/projects/tasksh.html
url :
	 https://taskwarrior.org/download/tasksh-1.2.0.tar.gz
description :
	 Shell wrapper for Taskwarrior commands
build_deps :
	 cmake
link_deps :
	 task
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
