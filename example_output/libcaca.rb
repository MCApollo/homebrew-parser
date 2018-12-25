name :
	 Libcaca
homepage :
	 http://caca.zoy.org/wiki/libcaca
url :
	 http://caca.zoy.org/files/libcaca/libcaca-0.99.beta19.tar.gz
description :
	 Convert pixel information into colored ASCII art
build_deps :
	 pkg-config
link_deps :
	 :x11
optional_deps :
	 imlib2
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./bootstrap" if build.head?
	 inreplace "python/Makefile.in", '$(am__py_compile) --destdir "$(DESTDIR)"', "$(am__py_compile) --destdir \"$(cacadir)\""
	 args = ["--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-doc",
	 "--disable-slang",
	 "--disable-java",
	 "--disable-csharp",
	 "--disable-ruby"]
	 args << "--disable-x11" if build.without? "imlib2"
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
