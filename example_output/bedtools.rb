name :
	 Bedtools
homepage :
	 https://github.com/arq5x/bedtools2
url :
	 https://github.com/arq5x/bedtools2/archive/v2.27.1.tar.gz
description :
	 Tools for genome arithmetic (set theory on the genome)
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
	 system "make"
	 system "make", "install", "prefix=#{prefix}"
	 prefix.install "RELEASE_HISTORY"
