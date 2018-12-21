name :
	 Ucg
homepage :
	 https://github.com/gvansickle/ucg
url :
	 https://github.com/gvansickle/ucg/releases/download/0.3.3/universalcodegrep-0.3.3.tar.gz
description :
	 Tool for searching large bodies of source code (like grep)
build_deps :
	 argp-standalone
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 pcre2
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/00615b/ucg/xcode9.patch
EOF_patch :
install :
	 system "autoreconf", "-i" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
