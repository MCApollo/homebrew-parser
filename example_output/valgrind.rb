name :
	 Valgrind
homepage :
	 http://www.valgrind.org/
url :
	 https://sourceware.org/pub/valgrind/valgrind-3.14.0.tar.bz2
description :
	 Dynamic analysis tools (memory, debug, profiling)
build_deps :
link_deps :
	 :maximum_macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 if MacOS.prefer_64_bit?
	 args << "--enable-only64bit" << "--build=amd64-darwin"
	 else
	 args << "--enable-only32bit"
	 end
	 system "./autogen.sh" if build.head?
	 unless MacOS::CLT.installed?
	 inreplace "coregrind/Makefile.in", %r{(\s)(?=/usr/include/mach/)}, '\1'+MacOS.sdk_path.to_s
	 end
	 system "./configure", *args
	 system "make"
	 system "make", "install"
