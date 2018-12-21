name :
	 Mercury
homepage :
	 https://mercurylang.org/
url :
	 https://dl.mercurylang.org/release/mercury-srcdist-14.01.1.tar.gz
description :
	 Logic/functional programming language
build_deps :
link_deps :
	 erlang
	 hwloc
	 mono
conflicts :
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--infodir=#{info}",
	 "--disable-dependency-tracking",
	 "--enable-java-grade"]
	 args << "--enable-erlang-grade" if build.with? "erlang"
	 args << "--with-hwloc" if build.with? "hwloc"
	 args << "--enable-csharp-grade" if build.with? "mono"
	 system "./configure", *args
	 system "make", "install", "PARALLEL=-j",
	 "INSTALL_MAN_DIR=#{man}",
	 "INSTALL_INFO_DIR=#{info}"
	 rm Dir.glob("#{bin}/*.bat")
