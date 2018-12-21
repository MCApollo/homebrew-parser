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
	 qt
	 wxmac
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11 if build.with? "qt"
	 if build.with? "aquaterm"
	 ENV.prepend "CPPFLAGS", "-F/Library/Frameworks"
	 ENV.prepend "LDFLAGS", "-F/Library/Frameworks"
