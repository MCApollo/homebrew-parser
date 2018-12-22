name :
	 Lean
homepage :
	 https://leanprover.github.io/
url :
	 https://github.com/leanprover/lean/archive/v3.4.1.tar.gz
description :
	 Theorem prover
build_deps :
	 cmake
link_deps :
	 gmp
	 jemalloc
conflicts :
patches :
EOF_patch :
install :
	 mkdir "src/build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
