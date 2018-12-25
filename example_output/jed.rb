name :
	 Jed
homepage :
	 https://www.jedsoft.org/jed/
url :
	 https://www.jedsoft.org/releases/jed/jed-0.99-19.tar.gz
description :
	 Powerful editor for programmers
build_deps :
link_deps :
	 s-lang
optional_deps :
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 cd "autoconf" do
	 system "make"
	 end
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--with-slang=#{Formula["s-lang"].opt_prefix}"
	 system "make"
	 system "make", "xjed" if build.with? "x11"
	 ENV.deparallelize
	 system "make", "install"
