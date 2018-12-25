name :
	 Lz4
homepage :
	 https://lz4.org/
url :
	 https://github.com/lz4/lz4/archive/v1.8.3.tar.gz
description :
	 Extremely Fast Compression algorithm
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
	 system "make", "install", "PREFIX=#{prefix}"
