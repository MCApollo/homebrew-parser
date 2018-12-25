name :
	 Tinysvm
homepage :
	 http://chasen.org/~taku/software/TinySVM/
url :
	 http://chasen.org/~taku/software/TinySVM/src/TinySVM-0.09.tar.gz
description :
	 Support vector machine library for pattern recognition
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/838f605/tinysvm/patch-configure.diff
EOF_patch :
install :
	 ENV.append_to_cflags "-D__GNU_LIBRARY__"
	 inreplace "configure", "-O9", ""
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--disable-shared"
	 system "make", "install"
