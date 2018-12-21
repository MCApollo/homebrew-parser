name :
	 SagittariusScheme
homepage :
	 https://bitbucket.org/ktakashi/sagittarius-scheme/wiki/Home
url :
	 https://bitbucket.org/ktakashi/sagittarius-scheme/downloads/sagittarius-0.9.4.tar.gz
description :
	 Free Scheme implementation supporting R6RS and R7RS
build_deps :
	 cmake
link_deps :
	 bdw-gc
	 libffi
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
