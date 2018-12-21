name :
	 Libwebm
homepage :
	 https://www.webmproject.org/code/
url :
	 https://github.com/webmproject/libwebm/archive/libwebm-1.0.0.27.tar.gz
description :
	 WebM container
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "macbuild" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 lib.install "libwebm.a"
	 bin.install %w[sample sample_muxer vttdemux webm2pes]
