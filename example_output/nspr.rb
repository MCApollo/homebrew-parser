name :
	 Nspr
homepage :
	 https://developer.mozilla.org/docs/Mozilla/Projects/NSPR
url :
	 https://archive.mozilla.org/pub/mozilla.org/nspr/releases/v4.20/src/nspr-4.20.tar.gz
description :
	 Platform-neutral API for system-level and libc-like functions
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 cd "nspr" do
	 target_frameworks = Hardware::CPU.is_32_bit? ? "-framework Carbon" : ""
	 inreplace "pr/src/Makefile.in", "-framework CoreServices -framework CoreFoundation", target_frameworks
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --enable-strip
	 --with-pthreads
	 --enable-ipv6
	 --enable-macos-target=#{MacOS.version}
	 ]
	 args << "--enable-64bit" if MacOS.prefer_64_bit?
	 system "./configure", *args
	 inreplace "config/autoconf.mk", "-install_name @executable_path/$@ ", "-install_name #{lib}/$@ "
	 system "make"
	 system "make", "install"
	 (bin/"compile-et.pl").unlink
	 (bin/"prerr.properties").unlink
	 end
