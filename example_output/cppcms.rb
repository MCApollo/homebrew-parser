name :
	 Cppcms
homepage :
	 http://cppcms.com/wikipp/en/page/main
url :
	 https://downloads.sourceforge.net/project/cppcms/cppcms/1.2.1/cppcms-1.2.1.tar.bz2
description :
	 Free High Performance Web Development Framework
build_deps :
	 cmake
link_deps :
	 openssl
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "cmake", *std_cmake_args
	 system "make", "install"
