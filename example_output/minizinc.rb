name :
	 Minizinc
homepage :
	 https://www.minizinc.org/
url :
	 https://github.com/MiniZinc/libminizinc/archive/2.2.3.tar.gz
description :
	 Medium-level constraint modeling language
build_deps :
	 cmake
link_deps :
	 :arch
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "cmake", "--build", ".", "--target", "install"
	 end
