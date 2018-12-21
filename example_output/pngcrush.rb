name :
	 Pngcrush
homepage :
	 https://pmt.sourceforge.io/pngcrush
url :
	 https://downloads.sourceforge.net/project/pmt/pngcrush/1.8.13/pngcrush-1.8.13.tar.xz
description :
	 Optimizer for PNG files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}",
	 "LD=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "LDFLAGS=#{ENV.ldflags}"
	 bin.install "pngcrush"
