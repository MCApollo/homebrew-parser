name :
	 GnuplotAT4
homepage :
	 http://www.gnuplot.info
url :
	 https://downloads.sourceforge.net/project/gnuplot/gnuplot/4.6.7/gnuplot-4.6.7.tar.gz
description :
	 Command-driven, interactive function plotting
build_deps :
	 pkg-config
link_deps :
	 fontconfig
	 gd
	 jpeg
	 libpng
	 libtiff
	 lua@5.1
	 readline
	 pdflib-lite
	 wxmac
	 pango
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PKG_CONFIG_PATH", Formula["lua@5.1"].opt_libexec/"lib/pkgconfig"
	 if build.with? "aquaterm"
	 ENV.prepend "CPPFLAGS", "-F/Library/Frameworks"
	 ENV.prepend "LDFLAGS", "-F/Library/Frameworks"
	 else
	 inreplace "configure", "-laquaterm", ""
