name :
	 Zstd
homepage :
	 https://facebook.github.io/zstd/
url :
	 https://github.com/facebook/zstd/releases/download/v1.3.7/zstd-1.3.7.tar.gz
description :
	 Zstandard is a real-time compression algorithm
build_deps :
	 cmake
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "PREFIX=#{prefix}/"
	 system "make", "-C", "contrib/pzstd", "googletest"
	 system "make", "-C", "contrib/pzstd", "PREFIX=#{prefix}"
	 bin.install "contrib/pzstd/pzstd"
