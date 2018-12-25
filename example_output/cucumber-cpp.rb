name :
	 CucumberCpp
homepage :
	 https://cucumber.io
url :
	 https://github.com/cucumber/cucumber-cpp/archive/v0.5.tar.gz
description :
	 Support for writing Cucumber step definitions in C++
build_deps :
	 cmake
link_deps :
	 ruby
	 boost
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DCUKE_DISABLE_GTEST=on"
	 args << "-DCUKE_DISABLE_CPPSPEC=on"
	 args << "-DCUKE_DISABLE_FUNCTIONAL=on"
	 args << "-DCUKE_DISABLE_BOOST_TEST=on"
	 system "cmake", ".", *args
	 system "cmake", "--build", "."
	 system "make", "install"
