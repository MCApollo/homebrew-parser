name :
	 Codequery
homepage :
	 https://github.com/ruben2020/codequery
url :
	 https://github.com/ruben2020/codequery/archive/v0.21.1.tar.gz
description :
	 Code-understanding, code-browsing or code-search tool
build_deps :
	 cmake
link_deps :
	 qt
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args
	 args << "-DBUILD_QT5=ON"
	 share.install "test"
	 mkdir "build" do
	 system "cmake", "..", "-G", "Unix Makefiles", *args
	 system "make"
	 system "make", "install"
	 end
