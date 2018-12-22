name :
	 Mmseqs2
homepage :
	 https://mmseqs.org/
url :
	 https://github.com/soedinglab/MMseqs2/archive/7-4e23d.tar.gz
description :
	 Software suite for very fast protein sequence search and clustering
build_deps :
	 cmake
link_deps :
	 gcc
conflicts :
patches :
EOF_patch :
install :
	 args = *std_cmake_args << "-DHAVE_TESTS=0" << "-DHAVE_MPI=0"
	 args << "-DVERSION_OVERRIDE=#{version}"
	 args << "-DHAVE_SSE4_1=1" if build.bottle?
	 system "cmake", ".", *args
	 system "make", "install"
	 resource("documentation").stage { doc.install Dir["*"] }
	 pkgshare.install "examples"
	 bash_completion.install "util/bash-completion.sh" => "mmseqs.sh"
	 end
	 def caveats
	 unless Hardware::CPU.sse4?
	 "MMseqs2 requires at least SSE4.1 CPU instruction support. The binary will not work correctly."
	 end
