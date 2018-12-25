name :
	 ZxingCpp
homepage :
	 https://github.com/zxing/zxing
url :
	 https://github.com/zxing/zxing/releases/download/zxing-2.3.0/ZXing-2.3.0.zip
description :
	 C++ port of the ZXing barcode decoder
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
	 cd "cpp" if build.stable?
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 if build.stable?
	 lib.install "libzxing.a"
	 bin.install "zxing"
	 cd "../core/src/"
	 Dir.glob "./zxing/**/*.h" do |header|
	 (include/File.dirname(header)).install header
	 end
	 end
	 system "make", "install" if build.head?
	 end
