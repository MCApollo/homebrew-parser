name :
	 Fdupes
homepage :
	 https://github.com/adrianlopezroche/fdupes
url :
	 https://github.com/adrianlopezroche/fdupes/archive/v1.6.1.tar.gz
description :
	 Identify or delete duplicate files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile", "gcc", "#{ENV.cc} #{ENV.cflags}"
	 system "make", "fdupes"
	 bin.install "fdupes"
	 man1.install "fdupes.1"
