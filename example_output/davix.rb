name :
	 Davix
homepage :
	 https://dmc.web.cern.ch/projects/davix/home
url :
	 https://github.com/cern-it-sdc-id/davix.git
description :
	 Library and tools for advanced file I/O with HTTP-based protocols
build_deps :
	 cmake
	 doxygen
	 python@2
link_deps :
	 openssl
	 ossp-uuid
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.libcxx
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
