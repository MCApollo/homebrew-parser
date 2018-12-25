name :
	 Snzip
homepage :
	 https://github.com/kubo/snzip
url :
	 https://bintray.com/artifact/download/kubo/generic/snzip-1.0.4.tar.gz
description :
	 Compression/decompression tool based on snappy
build_deps :
link_deps :
	 snappy
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
