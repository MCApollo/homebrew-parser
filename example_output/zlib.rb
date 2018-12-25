name :
	 Zlib
homepage :
	 https://zlib.net/
url :
	 https://zlib.net/zlib-1.2.11.tar.gz
description :
	 General-purpose lossless data-compression library
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['test_artifact']
	 ['https://zlib.net/zpipe.c']
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
