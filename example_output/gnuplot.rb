name :
	 Gnuplot
homepage :
	 http://www.gnuplot.info/
url :
	 https://downloads.sourceforge.net/project/gnuplot/gnuplot/5.2.5/gnuplot-5.2.5.tar.gz
description :
	 Command-driven, interactive function plotting
build_deps :
	 pkg-config
link_deps :
	 gd
	 lua
	 pango
	 readline
optional_deps :
	 qt
	 wxmac
	 :x11
conflicts :
resource :
	 ['libcerf']
	 ['https://www.mirrorservice.org/sites/distfiles.macports.org/libcerf/libcerf-1.5.tgz']
patches :
EOF_patch :
install :
	 ENV.cxx11 if build.with? "qt"
	 if build.with? "aquaterm"
	 ENV.prepend "CPPFLAGS", "-F/Library/Frameworks"
	 ENV.prepend "LDFLAGS", "-F/Library/Frameworks"
	 end
	 resource("libcerf").stage do
	 system "./configure", "--prefix=#{buildpath}/libcerf", "--enable-static", "--disable-shared"
	 system "make", "install"
	 end
	 ENV.prepend_path "PKG_CONFIG_PATH", buildpath/"libcerf/lib/pkgconfig"
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --with-readline=#{Formula["readline"].opt_prefix}
	 --without-tutorial
	 ]
	 args << "--disable-wxwidgets" if build.without? "wxmac"
	 args << (build.with?("aquaterm") ? "--with-aquaterm" : "--without-aquaterm")
	 args << (build.with?("qt") ? "--with-qt" : "--with-qt=no")
	 args << (build.with?("x11") ? "--with-x" : "--without-x")
	 system "./prepare" if build.head?
	 system "./configure", *args
	 ENV.deparallelize
	 system "make"
	 system "make", "install"
