name :
	 Nfdump
homepage :
	 https://nfdump.sourceforge.io
url :
	 https://github.com/phaag/nfdump/archive/v1.6.17.tar.gz
description :
	 Tools to collect and process netflow data on the command-line
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}", "--enable-readpcap"
	 system "make", "install"
