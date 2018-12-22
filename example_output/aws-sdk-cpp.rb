name :
	 AwsSdkCpp
homepage :
	 https://github.com/aws/aws-sdk-cpp
url :
	 https://github.com/aws/aws-sdk-cpp/archive/1.7.20.tar.gz
description :
	 AWS SDK for C++
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make"
	 system "make", "install"
	 end
	 lib.install Dir[lib/"mac/Release/*"].select { |f| File.file? f }
