name :
	 Bibtexconv
homepage :
	 https://www.uni-due.de/~be0001/bibtexconv/
url :
	 https://www.uni-due.de/~be0001/bibtexconv/download/bibtexconv-1.1.12.tar.gz
description :
	 BibTeX file converter
build_deps :
	 cmake
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", *std_cmake_args,
	 "-DCRYPTO_LIBRARY=#{Formula["openssl"].opt_lib}/libcrypto.dylib"
	 system "make", "install"
