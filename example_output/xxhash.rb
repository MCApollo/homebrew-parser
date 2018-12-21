name :
	 Xxhash
homepage :
	 https://github.com/Cyan4973/xxHash
url :
	 https://github.com/Cyan4973/xxHash/archive/v0.6.5.tar.gz
description :
	 Extremely fast non-cryptographic hash algorithm
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 system "make", "install", "PREFIX=#{prefix}"
