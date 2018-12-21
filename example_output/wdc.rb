name :
	 Wdc
homepage :
	 https://designerror.github.io/webdav-client-cpp
url :
	 https://github.com/designerror/webdav-client-cpp/archive/v1.0.1.tar.gz
description :
	 WebDAV Client provides easy and convenient to work with WebDAV-servers
build_deps :
	 cmake
link_deps :
	 openssl
	 pugixml
conflicts :
patches :
EOF_patch :
install :
	 pugixml = Formula["pugixml"]
	 ENV.prepend "CXXFLAGS", "-I#{pugixml.opt_include.children.first}"
	 system "cmake", ".", "-DPUGIXML_INCLUDE_DIR=#{pugixml.opt_include}",
	 "-DPUGIXML_LIBRARY=#{pugixml.opt_lib}", *std_cmake_args
	 system "make", "install"
