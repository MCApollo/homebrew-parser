name :
	 Libantlr3c
homepage :
	 https://www.antlr3.org/
url :
	 https://www.antlr3.org/download/C/libantlr3c-3.4.tar.gz
description :
	 ANTLRv3 parsing library for C
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
	 args = ["--disable-dependency-tracking",
	 "--disable-antlrdebug",
	 "--prefix=#{prefix}"]
	 args << "--enable-64bit" if MacOS.prefer_64_bit?
	 system "./configure", *args
	 inreplace "Makefile" do |s|
	 cflags = s.get_make_var "CFLAGS"
	 cflags = cflags << " -fexceptions"
	 s.change_make_var! "CFLAGS", cflags
	 end
	 system "make", "install"
