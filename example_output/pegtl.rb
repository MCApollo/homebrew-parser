name :
	 Pegtl
homepage :
	 https://github.com/taocpp/PEGTL
url :
	 https://github.com/taocpp/PEGTL/archive/2.7.1.tar.gz
description :
	 Parsing Expression Grammar Template Library
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 prefix.install "include"
	 rm "src/example/pegtl/CMakeLists.txt"
	 (pkgshare/"examples").install (buildpath/"src/example/pegtl").children
