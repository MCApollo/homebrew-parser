name :
	 Newt
homepage :
	 https://pagure.io/newt
url :
	 https://pagure.io/releases/newt/newt-0.52.20.tar.gz
description :
	 Library for color text mode, widget based user interfaces
build_deps :
link_deps :
	 gettext
	 popt
	 s-lang
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = ["--prefix=#{prefix}", "--without-tcl"]
	 inreplace "Makefile.in" do |s|
	 s.gsub! "libnewt.$(SOEXT).$(SONAME)", "libnewt.$(SONAME).dylib"
	 s.gsub! "libnewt.$(SOEXT).$(VERSION)", "libnewt.$(VERSION).dylib"
	 s.gsub! "`$$pyconfig --ldflags`", '"-undefined dynamic_lookup"'
	 s.gsub! "`$$pyconfig --libs`", '""'
	 end
	 system "./configure", *args
	 system "make", "install"
