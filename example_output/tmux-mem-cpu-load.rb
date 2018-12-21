name :
	 TmuxMemCpuLoad
homepage :
	 https://github.com/thewtex/tmux-mem-cpu-load
url :
	 https://github.com/thewtex/tmux-mem-cpu-load/archive/v3.4.0.tar.gz
description :
	 CPU, RAM memory, and load monitor for use with tmux
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
