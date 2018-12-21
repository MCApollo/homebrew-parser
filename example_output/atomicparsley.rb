name :
	 Atomicparsley
homepage :
	 https://bitbucket.org/wez/atomicparsley/overview/
url :
	 https://bitbucket.org/wez/atomicparsley/get/0.9.6.tar.bz2
description :
	 MPEG-4 command-line tool
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/ac8624c36e/atomicparsley/xcode9.patch
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-debug",
	 "--disable-universal"
	 system "make", "install"
