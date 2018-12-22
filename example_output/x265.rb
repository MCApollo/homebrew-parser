name :
	 X265
homepage :
	 http://x265.org
url :
	 https://bitbucket.org/multicoreware/x265/downloads/x265_2.9.tar.gz
description :
	 H.265/HEVC encoder
build_deps :
	 cmake
	 nasm
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %w[
	 -DLINKED_10BIT=ON
	 -DLINKED_12BIT=ON
	 -DEXTRA_LINK_FLAGS=-L.
	 -DEXTRA_LIB=x265_main10.a;x265_main12.a
	 ]
	 high_bit_depth_args = std_cmake_args + %w[
	 -DHIGH_BIT_DEPTH=ON -DEXPORT_C_API=OFF
	 -DENABLE_SHARED=OFF -DENABLE_CLI=OFF
	 ]
	 (buildpath/"8bit").mkpath
	 mkdir "10bit" do
	 system "cmake", buildpath/"source", *high_bit_depth_args
	 system "make"
	 mv "libx265.a", buildpath/"8bit/libx265_main10.a"
	 end
	 mkdir "12bit" do
	 system "cmake", buildpath/"source", "-DMAIN12=ON", *high_bit_depth_args
	 system "make"
	 mv "libx265.a", buildpath/"8bit/libx265_main12.a"
	 end
	 cd "8bit" do
	 system "cmake", buildpath/"source", *args
	 system "make"
	 mv "libx265.a", "libx265_main.a"
	 system "libtool", "-static", "-o", "libx265.a", "libx265_main.a",
	 "libx265_main10.a", "libx265_main12.a"
	 system "make", "install"
	 end
