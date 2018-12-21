name :
	 Libnet
homepage :
	 https://github.com/sam-github/libnet
url :
	 https://downloads.sourceforge.net/project/libnet-dev/libnet-1.1.6.tar.gz
description :
	 C library for creating IP packets
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/a689647/libnet/patch-configure.in.diff
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 inreplace "src/libnet_link_bpf.c", "
	 system "make", "install"
