name :
	 MacRobber
homepage :
	 https://www.sleuthkit.org/mac-robber/
url :
	 https://downloads.sourceforge.net/project/mac-robber/mac-robber/1.02/mac-robber-1.02.tar.gz
description :
	 Digital investigation tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "GCC_OPT=#{ENV.cflags}"
	 bin.install "mac-robber"
