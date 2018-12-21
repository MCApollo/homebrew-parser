name :
	 Aom
homepage :
	 https://aomedia.googlesource.com/aom
url :
	 https://aomedia.googlesource.com/aom.git
description :
	 Codec library for encoding and decoding AV1 video streams
build_deps :
	 cmake
	 yasm
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "macbuild" do
	 system "cmake", "..", *std_cmake_args,
	 "-DENABLE_DOCS=off",
	 "-DENABLE_EXAMPLES=on",
	 "-DENABLE_TESTDATA=off",
	 "-DENABLE_TESTS=off",
	 "-DENABLE_TOOLS=off"
	 system "make", "install"
