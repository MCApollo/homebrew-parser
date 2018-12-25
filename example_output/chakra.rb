name :
	 Chakra
homepage :
	 https://github.com/Microsoft/ChakraCore
url :
	 https://github.com/Microsoft/ChakraCore/archive/v1.11.4.tar.gz
description :
	 The core part of the JavaScript engine that powers Microsoft Edge
build_deps :
	 cmake
link_deps :
	 icu4c
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = [
	 "--lto-thin",
	 "--icu=#{Formula["icu4c"].opt_include}",
	 "--extra-defines=U_USING_ICU_NAMESPACE=1",
	 "-j=#{ENV.make_jobs}",
	 "-y",
	 ]
	 system "./build.sh", *args
	 system "./build.sh", "--static", *args
	 bin.install "out/Release/ch" => "chakra"
	 include.install Dir["out/Release/include/*"]
	 lib.install "out/Release/libChakraCore.dylib"
