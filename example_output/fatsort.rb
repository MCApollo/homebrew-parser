name :
	 Fatsort
homepage :
	 https://fatsort.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/fatsort/fatsort-1.5.0.456.tar.xz
description :
	 Sorts FAT16 and FAT32 partitions
build_deps :
link_deps :
	 help2man
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}"
	 bin.install "src/fatsort"
	 man1.install "man/fatsort.1"
