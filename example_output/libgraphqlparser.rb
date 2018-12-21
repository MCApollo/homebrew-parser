name :
	 Libgraphqlparser
homepage :
	 https://github.com/graphql/libgraphqlparser
url :
	 https://github.com/graphql/libgraphqlparser/archive/0.7.0.tar.gz
description :
	 GraphQL query parser in C++ with C and C++ APIs
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make"
	 system "make", "install"
	 libexec.install "dump_json_ast"
