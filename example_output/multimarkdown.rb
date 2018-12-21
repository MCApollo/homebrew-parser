name :
	 Multimarkdown
homepage :
	 https://fletcher.github.io/MultiMarkdown-6/
url :
	 https://github.com/fletcher/MultiMarkdown-6/archive/6.4.0.tar.gz
description :
	 Turn marked-up plain text into well-formatted documents
build_deps :
	 cmake
link_deps :
conflicts :
	 mtools
	 markdown
	 discount
patches :
EOF_patch :
install :
	 inreplace "CMakeLists.txt",
	 "SET(CMAKE_OSX_DEPLOYMENT_TARGET \"10.4\"",
	 "SET(CMAKE_OSX_DEPLOYMENT_TARGET \"#{MacOS.version}\""
	 system "make", "release"
	 cd "build" do
	 system "make"
	 bin.install "multimarkdown"
